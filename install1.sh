apt update –y
apt upgrade -y
apt install build-essential gnupg2 gcc make
y
# wget https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/releases/download/v4.39-9772-beta/softether-vpnserver-v4.39-9772-beta-2022.04.26-linux-x64-64bit.tar.gz
wget https://www.softether-download.com/files/softether/v4.42-9798-rtm-2023.06.30-tree/Linux/SoftEther_VPN_Server/64bit_-_Intel_x64_or_AMD64/softether-vpnserver-v4.42-9798-rtm-2023.06.30-linux-x64-64bit.tar.gz
tar xvf softether-vpnserver-*.tar.gz
cd vpnserver/
sudo apt install gcc binutils gzip libreadline-dev libssl-dev libncurses5-dev libncursesw5-dev libpthread-stubs0-dev
y
make
cd ..
sudo mv vpnserver /opt/softether
sudo /opt/softether/vpnserver start
sudo nano /etc/systemd/system/softether-vpnserver.service
# file data
[Unit]

Description=SoftEther VPN server

After=network-online.target

After=dbus.service

[Service]

Type=forking

ExecStart=/opt/softether/vpnserver start

ExecReload=/bin/kill -HUP $MAINPID

[Install]

WantedBy=multi-user.target
# end file data
