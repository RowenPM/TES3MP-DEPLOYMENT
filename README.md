# TES3MP-DEPLOYMENT
## About
This script was developed to automate the deployment of the tes3mp server onto a fresh Debian 10 installation. 
The script will prompt you for your server name. This is what you will look for in the tes3mp server browser.

## Instructions
First, SSH into your fresh Debian 10 server.
Download the start.sh from our repository. 
Use <code>chmod +x start.sh</code> to enable it as an executable.
You may then use ./start.sh to deploy the server.

## Detailed explanation
The script installs UFW and allows traffic on ports 22 (SSH), 25565(TES3MP), 25560(Server Masterlist).
Then, it installs both `libluajit-5.1-2` and `libgl1` (Required for the server).
In the next step, the script downloads the 0.7 server release, extracts & then deletes the archive. Then it enters the directory and makes sure sed is installed.
The script uses sed to change the server config to use verbose server info, and change the servername to your input.
After the script is complete, you may press any key to return to console. The server is now running in a screen which will stay open when you close your SSH connection. 
If you want to open the screen for the server, use screen -r
