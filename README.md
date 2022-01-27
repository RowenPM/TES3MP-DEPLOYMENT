# TES3MP-DEPLOYMENT
## About
This script was developed to automate the deployment of the tes3mp server onto a fresh Debian 10 installation.<br>
The script will prompt you for your server name. This is what you will look for in the tes3mp server browser.<br>

## Instructions
First, SSH into your fresh Debian 10 server.<br>
Download the start.sh from our repository.<br>
Use chmod +x start.sh to enable it as an executable.<br>
You may then use ./start.sh to deploy the server.<br>

## Detailed explanation
The script installs UFW and allows traffic on ports 22 (SSH), 25565(TES3MP), 25560(Server Masterlist).<br>
Then, it installs both libluajit-5.1-2 and libgl1 (Required for the server).<br>
In the next step, the script downloads the 0.7 server release, extracts & then deletes the archive. Then it enters the directory and makes sure sed is installed.<br>
The script uses sed to change the server config to use verbose server info, and change the servername to your input.<br>
After the script is complete, you may press any key to return to console. The server is now running in a screen which will stay open when you close your SSH connection. <br>
If you want to open the screen for the server, use screen -r<br>
 
## Instructions for Linode deployment
Launch a linode server with 1GB of RAM using a Debian 11 image.
Then SSH into the server using the IP provided
ssh root@IP_PROVIDED 
Install ZSH Shell
mkdir Tekkit
cd Tekkit
