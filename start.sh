sudo apt-get install ufw -y
sudo ufw allow 22 && sudo ufw allow 25565 && sudo ufw allow 25560 
echo "y" | sudo ufw enable
sudo apt-get install libluajit-5.1-2 libgl1 -y
wget https://github.com/TES3MP/openmw-tes3mp/releases/download/0.7.0-alpha/tes3mp-server-GNU+Linux-x86_64-release-0.7.0-alpha-abc4090a0f-01d297f5c6.tar.gz
tar -xzvf tes3mp-server-GNU+Linux-x86_64-release-0.7.0-alpha-abc4090a0f-01d297f5c6.tar.gz
rm tes3mp-server-GNU+Linux-x86_64-release-0.7.0-alpha-abc4090a0f-01d297f5c6.tar.gz
cd TES3MP-server/
sudo apt-get install sed -y
sed -i -e '/logLevel/s/1/0/' tes3mp-server-default.cfg  
read -p "Enter your desired server name:" fullname
sed -i "6s/.*/hostname = $fullname/" tes3mp-server-default.cfg     
sudo apt-get install screen -y
screen -dmS tes3MP ./tes3mp-server
read -n 1 -s -r -p "Installation complete, press any key to close`echo $'\n> '`"
