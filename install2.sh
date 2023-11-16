# Log in using PuTTy. We’ll start with updating our server.
apt-get update && apt-get upgrade -y

# Install necessary dependencies.
apt-get install build-essential -y && apt-get install net-tools -y

#Download the latest version of SoftEther. (Latest at the time of this writing)
wget https://www.softether-download.com/files/softether/v4.42-9798-rtm-2023.06.30-tree/Linux/SoftEther_VPN_Server/64bit_-_Intel_x64_or_AMD64/softether-vpnserver-v4.42-9798-rtm-2023.06.30-linux-x64-64bit.tar.gz

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
3
check
exit
