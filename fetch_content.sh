#!/bin/bash

# Directories
SOURCE_POSTS="source/_posts"
FETCHED_DIR="$SOURCE_POSTS/fetched"
TEMP_DIR="temp_repos"

# Repositories
CTF_REPO="https://github.com/GauravNJain/ctf-writeups"
BLOG_REPO="https://github.com/GauravNJain/blog-writings"
NOTES_REPO="https://github.com/GauravNJain/notes"
PROJECTS_REPO="https://github.com/GauravNJain/projects"

echo "Cleaning up old fetched content..."
rm -rf "$FETCHED_DIR"
rm -rf "$TEMP_DIR"
mkdir -p "$FETCHED_DIR"
mkdir -p "$TEMP_DIR"

fetch_repo() {
    local repo_url=$1
    local dest_name=$2
    local root_category=$3

    echo "Fetching $repo_url..."
    # Clone the repository without --depth 1 to preserve commit history for dates
    git clone "$repo_url" "$TEMP_DIR/$dest_name"

    # Create destination directory
    mkdir -p "$FETCHED_DIR/$dest_name"
    
    # Process all markdown files
    find "$TEMP_DIR/$dest_name" -name "*.md" -not -name "README.md" | while read -r file; do
        # Determine paths
        relative_path="${file#$TEMP_DIR/$dest_name/}"
        dest_file="$FETCHED_DIR/$dest_name/$relative_path"
        mkdir -p "$(dirname "$dest_file")"
        
        # Build category array based on directory structure
        rel_dir=$(dirname "$relative_path")
        if [ "$rel_dir" == "." ]; then
            categories="[\"$root_category\"]"
        else
            # Split path into parts and wrap each in quotes
            IFS='/' read -ra PARTS <<< "$rel_dir"
            categories="[\"$root_category\""
            for part in "${PARTS[@]}"; do
                categories+=", \"$part\""
            done
            categories+="]"
        fi

        # Get the original commit date of the file, fallback to current date if empty
        file_date=$(git -C "$TEMP_DIR/$dest_name" log -1 --format="%ad" --date=format:"%Y-%m-%d %H:%M:%S" -- "$relative_path")
        [ -z "$file_date" ] && file_date=$(date +"%Y-%m-%d %H:%M:%S")

        # Extract file content and handle front matter
        if head -n 1 "$file" | grep -q -- "---"; then
            # File already has front matter, copy it over
            cp "$file" "$dest_file"
            
            # Inject categories if missing
            if ! grep -q "^categories:" "$dest_file"; then
                # Insert after the title or on the second line
                sed -i "2i categories: $categories" "$dest_file"
            fi
            
            # Inject date if missing
            if ! grep -q "^date:" "$dest_file"; then
                sed -i "2i date: $file_date" "$dest_file"
            fi
        else
            # File has no front matter, create a new one
            title=$(basename "$file" .md | sed 's/_/ /g')
            
            echo "---" > "$dest_file"
            echo "title: \"$title\"" >> "$dest_file"
            echo "categories: $categories" >> "$dest_file"
            echo "date: $file_date" >> "$dest_file"
            echo "---" >> "$dest_file"
            echo "" >> "$dest_file"
            cat "$file" >> "$dest_file"
        fi
        
        # Optional: Clean up formatting issues common in manual writeups
        # Ensure there is a newline after the front matter if we injected it
        
        # Fix GitHub image URLs
        sed -i 's|https://github.com/\([^/]*\)/\([^/]*\)/blob/|https://raw.githubusercontent.com/\1/\2/|g' "$dest_file"
    done
}

# Fetch all repositories
fetch_repo "$CTF_REPO" "ctf" "CTF Writeups"
fetch_repo "$BLOG_REPO" "blog" "Writings"
fetch_repo "$NOTES_REPO" "notes" "Notes"
fetch_repo "$PROJECTS_REPO" "projects" "Projects"

echo "Content fetching complete."
rm -rf "$TEMP_DIR"
