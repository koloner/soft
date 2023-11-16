# Log in using PuTTy. We’ll start with updating our server.
apt-get update && apt-get upgrade -y

# Install necessary dependencies.
apt-get install build-essential && apt-get install net-tools

#Download the latest version of SoftEther. (Latest at the time of this writing)
wget https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/releases/download/v4.39-9772-beta/softether-vpnserver-v4.39-9772-beta-2022.04.26-linux-x64-64bit.tar.gz

#Extract the installer. You can autocomplete the line by pressing “Tab” when typing “softether”.
tar xvf softether-vpnserver-*.tar.gz

#Navigate to new directory and install SoftEther.
cd vpnserver
make

# Go back to your home directory, move the extracted directory to /usr/local directory, navigate to the new vpnserver location, and set the permissions of it.
cd ../
mv vpnserver /usr/local
cd /usr/local/vpnserver/
chmod 600 *
chmod 700 vpncmd
chmod 700 vpnserver

# Perform a final check to see whether VPN Server can operate properly on your computer system before starting vpnserver. Then exit the test.
./vpncmd
1
check
exit
