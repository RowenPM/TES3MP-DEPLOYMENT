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
wget https://github.com/RowenPM/TES3MP-DEPLOYMENT/blob/main/start.sh
<br>
Use the following command to enable it as an executable and execute it to deploy the server
Use chmod +x start.sh .<br>
You may then use ./start.sh to deploy the server.<br>

## Detailed explanation
The script installs UFW and allows traffic on ports 22 (SSH), 25565(TES3MP), 25560(Server Masterlist).<br>
Then, it installs both libluajit-5.1-2 and libgl1 (Required for the server).<br>
In the next step, the script downloads the 0.7 server release, extracts & then deletes the archive. Then it enters the directory and makes sure sed is installed.<br>
The script uses sed to change the server config to use verbose server info, and change the servername to your input.<br>
After the script is complete, you may press any key to return to console. The server is now running in a screen which will stay open when you close your SSH connection. <br>
If you want to open the screen for the server, use screen -r<br>
 