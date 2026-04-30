---
title: "Wazuh SIEM Local Lab - Complete Setup"
categories: ["Projects", "Wazuh Lab"]
date: 2026-04-29 22:01:07
---

# 🚀 Wazuh SIEM Local Lab - Complete Setup

A hands-on **Wazuh SIEM lab** built locally to learn real-world threat detection, endpoint monitoring, and log analysis.  
This project includes a complete setup of the Wazuh Manager, Dashboard, and multiple endpoint agents, giving me a full mini-SOC environment to practice cybersecurity operations.

> 🔥 **Goal:** Build my own SIEM environment, understand endpoint telemetry, and explore how Wazuh strengthens visibility, detection, and response.

<!-- Banner Image at the Top -->
<p align="center">
  <img src="https://raw.githubusercontent.com/GauravNJain/Wazuh-Lab-Setup/main/lab%20screenshots/WazuhBannerImage.png" alt="Wazuh Lab Banner" width="80%">
</p>

---

## 🏗️ Lab Architecture

### **🖥️ Wazuh Server**
- Ubuntu Server  
- Wazuh Manager  
- Wazuh API  
- Wazuh Dashboard

### **💻 Wazuh Agents**
- 🪟 Windows 10 endpoint  
- 🐧 Ubuntu Desktop endpoint  

---

## ⚙️ Installation & Setup Guide

### **1️⃣ Download and run the Wazuh installation assistant. (Ubuntu Server)**

```bash
curl -sO https://packages.wazuh.com/4.14/wazuh-install.sh && sudo bash ./wazuh-install.sh -a
```
![login credentials](https://raw.githubusercontent.com/GauravNJain/Wazuh-Lab-Setup/main/lab%20screenshots/(Server)%20Ubuntu%2064-bit%20cerdentials.png)

### **2️⃣ Login with the generated credentials**
- The login dashboard with be hosted on 127.0.0.1 by default on port 443

![wazuh login page](https://raw.githubusercontent.com/GauravNJain/Wazuh-Lab-Setup/main/lab%20screenshots/(Server)%20Ubuntu%2064-bit%20wazuh%20login%20page.png)

### **3️⃣ Deploy new agent**
- Click on "Deploy new agent" to add a new agent

![deploying new agent through wazuh dashboard](https://raw.githubusercontent.com/GauravNJain/Wazuh-Lab-Setup/main/lab%20screenshots/(Server)%20Ubuntu%2064-bit%20wazuh%20dashboard.png)

### **4️⃣ Select the agent configuration (Ubuntu agent)**
- Select the machine machine architecture and IP address of the wazuh server

![selecting the configuration of agent](https://raw.githubusercontent.com/GauravNJain/Wazuh-Lab-Setup/main/lab%20screenshots/(Server)%20Ubuntu%2064-bit%20deploying%20agent.png)

- Run the following command in the linux agent that we want to add to wazuh & start the wazuh services
  
![the command to run on the linux agent](https://raw.githubusercontent.com/GauravNJain/Wazuh-Lab-Setup/main/lab%20screenshots/(Server)%20Ubuntu%2064-bit%20starting%20wazuh%20agent.png)

### **5️⃣ Installing the wazuh agent on linux machine**
- Runnning the following custom command to install wazuh agent for our specified server

![installing wazuh agent on linux ubuntu machine](https://raw.githubusercontent.com/GauravNJain/Wazuh-Lab-Setup/main/lab%20screenshots/(Desktop)%20Ubuntu%2064-bit%20installing%20wazuh%20agent.png)

- Setting up services for wazuh agent to automatically start wazuh everytime we boot up our linux system

![setting up wazuh agent service](https://raw.githubusercontent.com/GauravNJain/Wazuh-Lab-Setup/main/lab%20screenshots/(Desktop)%20Ubuntu%2064-bit%20starting%20wazuh%20agent.png)

### **6️⃣ The linux maxhine will now be added!**
- Now we can monitor our machine from the Wazuh Dashboard

![linux machine added to wazuh](https://raw.githubusercontent.com/GauravNJain/Wazuh-Lab-Setup/main/lab%20screenshots/(Server)%20Ubuntu%2064-bit%20wazuh%20agent%20dashboard%20linux%20endpoint%20added.png)

### **7️⃣ Monitoring the Linux Agent**
- Now we can use these amazing wazuh features to easily monitor the agents that we have added *(Not only the MITRE ATT&CK Framework and events but muc more to explore on the main dashboard!!)*

![monitoring MITRE ATT&CK dashboard](https://raw.githubusercontent.com/GauravNJain/Wazuh-Lab-Setup/main/lab%20screenshots/(Server)%20Ubuntu%2064-bit%20wazuh%20linux%20agent%20dashboard.png)

### **8️⃣ Adding the windows machine agent**
- The same way we'll add the windows machine agent by selecting the configurations and the run the custom command from the wazuh server, on the windows agent in Powershell to install the wazuh agent on windows

![run pwsh as administrator](https://raw.githubusercontent.com/GauravNJain/Wazuh-Lab-Setup/main/lab%20screenshots/(Desktop)%20Clone%20of%20Windows%2010%20x64%20open%20pwsh%20as%20admin.png)

![installing wazuh agent & starting services on windows](https://raw.githubusercontent.com/GauravNJain/Wazuh-Lab-Setup/main/lab%20screenshots/(Desktop)%20Clone%20of%20Windows%2010%20x64%20installing%20and%20starting%20wazuh%20agent.png)

### **9️⃣ Now the Windows agent will also be added on the Wazuh server dashboard**
- The agent will now be shown in the 'Endpoints' section on wazuh server dashboard

![windows agent added to wazuh](https://raw.githubusercontent.com/GauravNJain/Wazuh-Lab-Setup/main/lab%20screenshots/(Server)%20Ubuntu%2064-bit%20wazuh%20dashboard%20linux%20and%20windows%20agent%20added.png)

### **🔟 Now even the windows endpoint can easily be monitor on the server using Wazuh**
- We can use wazuh to monitor our windows agents from basic vulnerability detection to advanced threat hunting, almost everything!

![threat hunting dashboard for windows agent](https://raw.githubusercontent.com/GauravNJain/Wazuh-Lab-Setup/main/lab%20screenshots/(Server)%20Ubuntu%2064-bit%20threat%20hunting%20logs%20for%20windows%20agent.png)

![vulnerability detection dashboard for windows agent](https://raw.githubusercontent.com/GauravNJain/Wazuh-Lab-Setup/main/lab%20screenshots/(Server)%20Ubuntu%2064-bit%20wazuh%20dashboard%20for%20windows%20agent.png)

---

## 🎯 Conclusion

Setting up this Wazuh SIEM lab has given me real, hands-on experience with endpoint monitoring, threat detection, log analytics, and vulnerability assessment *(and much more..)* across both Linux and Windows environments. Wazuh is an incredibly powerful and versatile tool that makes it easy to gain deep visibility into your endpoints, detect advanced threats, and analyze security events in real time. By deploying multiple agents and exploring dashboards like MITRE ATT&CK, Threat Hunting, and Vulnerability Detection, I now have a fully functional mini-SOC to sharpen my blue-team skills and understand enterprise-grade security monitoring first-hand.

---

## 📚 Reference

*Referred from the* <a href="https://documentation.wazuh.com/current/quickstart.html" target="_blank" rel="noopener noreferrer">official Wazuh Quickstart Guide</a><br>
*Github Repo* <a href="https://raw.githubusercontent.com/GauravNJain/Wazuh-Lab-Setup/main/README.md">link</a>
