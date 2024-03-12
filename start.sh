# Script created by: Rowen Paredes-Morris
# github.com/RowenPM
#
# 1 Taking input for the servername to be put into the config before launch
read -p "Enter your desired server name:" fullname

# 2 Getting updates for the new system
sudo apt-get update -y && sudo apt-get upgrade -y

# 3 Installing required packages for setup
sudo apt-get install ufw screen libluajit-5.1-2 -y

# 4 Open ports 22, 25565, 25560 for the SSH server, server connections, and masterlist pings respectively, then enables the firewall.
sudo ufw allow 22 && sudo ufw allow 25565 && sudo ufw allow 25560
echo "y" | sudo ufw enable

# 5 Downloading the required TES3MP Server and extracting it, then navigating inside
wget https://github.com/TES3MP/TES3MP/releases/download/tes3mp-0.8.1/tes3mp-server-GNU+Linux-x86_64-release-0.8.1-68954091c5-6da3fdea59.tar.gz && tar -xzvf tes3mp-server-GNU+Linux-x86_64-release-0.8.1-68954091c5-6da3fdea59.tar.gz && rm tes3mp-server-GNU+Linux-x86_64-release-0.8.1-68954091c5-6da3fdea59.tar.gz && cd TES3MP-server/


# 6 Manipulatingi strings within the config to change the log-level to 0, and then changing the servername to your previous input
sed -i '/logLevel/s/1/0/' tes3mp-server-default.cfg  
sed -i "7s/hostname.*/hostname = $fullname/" tes3mp-server-default.cfg

# 7 This screen command launches tes3mp server in a screen named tes3MP, and detaches the screen. You may re-attach the screen with screen -r
screen -dmS tes3mp bash ./tes3mp-server
#Goodbye message
printf "\nInstallation complete, finished script \n"
