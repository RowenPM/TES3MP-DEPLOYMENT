#Taking input for the servername at the beginning of the script to 
read -p "Enter your desired server name:" fullname

#This command installs libluajit, and libgl1 which both caused errors before launching the server in previous attempts on a
#fresh debian installation. 
#It installs the screen package which is used to run the server process in the background. (Pressing the Enter key causes the 
#server to terminate
#It also ensures that sed is installed, though it should be by default
sudo apt-get install ufw libluajit-5.1-2 libgl1 sed screen -y

#This command opens ports 22, 25565, 25560 (Relating to the SSH server, tes3mp server, and tes3mp master serverlist connections respectively).
#Next command enables the firewall without a prompt.
sudo apt-get install -y
sudo ufw allow 22 && sudo ufw allow 25565 && sudo ufw allow 25560
echo "y" | sudo ufw enable

#Download the server files from tes3mp github repository with wget
#Use tar to extract the archive,remove it, then browse into it in one line.
wget https://github.com/TES3MP/openmw-tes3mp/releases/download/0.7.0-alpha/tes3mp-server-GNU+Linux-x86_64-release-0.7.0-alpha-abc4090a0f-01d297f5c6.tar.gz && tar -xzvf tes3mp-server-GNU+Linux-x86_64-release-0.7.0-alpha-abc4090a0f-01d297f5c6.tar.gz && rm tes3mp-server-GNU+Linux-x86_64-release-0.7.0-alpha-abc4090a0f-01d297f5c6.tar.gz && cd TES3MP-server/

sed -i '/logLevel/s/1/0/' tes3mp-server-default.cfg  
sed -i "6s/.*/hostname = $fullname/" tes3mp-server-default.cfg     

#This screen command launches tes3mp server in a screen process called tes3MP, and detaches the screen. Reattach with screen -r
screen -dmS tes3MP ./tes3mp-server

#Goodbye message
printf "\nInstallation complete, finished script \n"
