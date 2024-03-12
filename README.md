# TES3MP-DEPLOYMENT
## About
This script was developed to automate the deployment of the tes3mp server onto a fresh Debian 12 VPS.<br>
The script will install dependencies, then prompt you for the name your server will as it will appear in the tes3mp server browser.<br>

## Instructions
Using Linode, create a VPS. For this deployment we select the following settings:
Image: Debian 12
Plan: 1GB Shared CPU ($5/month)

Using a shell, connect to your VPS:
    ssh root@vpsdomain.com
<br>
Download the start.sh from our repository:
    wget https://raw.githubusercontent.com/RowenPM/TES3MP-DEPLOYMENT/main/start.sh<br>
Use the following command to enable it as an executable and execute it to deploy the server:<br>
    chmod +x start.sh && ./start.sh<br>

## Detailed explanation
The script first prompts you for your server's display name, which is the only input required during the script.
Afterwards, the script updates and upgrades the packages of the system which it is running on, and installs all required packages:
- libluajit-5.1-2 which is required for the server
- screen which is used to run the server process in the background
- ufw which is a firewall to only allow traffic on three specific ports:
   - 22 (SSH)
   - 25565 (TES3MP)
   - 25560 (Server Masterlist)

It enables the firewall, and then it downloads the official TES3MP 0.8.1 server build, extracts it, cleans up the archive, navigates into the folder and manipulates the server config to add the server display name and change the verbosity of the logs.
The final thing it does is launch the tes3mp server in a detached screen, and provide you a confirmation message.

You can now open tes3mp server browser and find your server according to the name entered