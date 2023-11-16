#!/bin/bash

# Update and upgrade the server
apt-get update && apt-get upgrade -y

# Install necessary dependencies
apt-get install -y build-essential net-tools

# Download and extract the latest version of SoftEther
wget https://www.softether-download.com/files/softether/v4.42-9798-rtm-2023.06.30-tree/Linux/SoftEther_VPN_Server/64bit_-_Intel_x64_or_AMD64/softether-vpnserver-v4.42-9798-rtm-2023.06.30-linux-x64-64bit.tar.gz
tar xvf softether-vpnserver-*.tar.gz

# Install SoftEther
cd vpnserver
make
cd ..

# Move SoftEther to /usr/local and set permissions
mv vpnserver /usr/local
cd /usr/local/vpnserver/
chmod 600 *
chmod 700 vpncmd vpnserver

# Check if VPN Server can operate properly
./vpncmd
3
check
exit

# Create systemd service file for SoftEther VPN
cat << EOF | sudo tee /etc/systemd/system/vpnserver.service
[Unit]
Description=SoftEther VPN Server
After=network.target

[Service]
Type=forking
ExecStart=/usr/local/vpnserver/vpnserver start
ExecStop=/usr/local/vpnserver/vpnserver stop
ExecReload=/usr/local/vpnserver/vpnserver restart
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd and start SoftEther VPN service
sudo systemctl daemon-reload
sudo systemctl enable vpnserver.service
sudo systemctl start vpnserver.service
