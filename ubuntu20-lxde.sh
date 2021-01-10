wget --tries=20 https://raw.githubusercontent.com/MushfiqAziz/ubuntu20/main/lxde19.sh -O $folder/root/lxde19.sh
clear
rm -rf $folder/root/.bash_profile
echo "APT::Acquire::Retries \"3\";" > $folder/etc/apt/apt.conf.d/80-retries #Setting APT retry count
touch $folder/root/.hushlogin
echo "#!/bin/bash
rm -rf /etc/resolv.conf
echo 'nameserver 8.8.8.8
nameserver 1.1.1.1' > /etc/resolv.conf
mkdir -p ~/.vnc
apt update -y && apt install sudo wget -y > /dev/null
clear
if [ ! -f /root/lxde19.sh ]; then
    wget --tries=20 https://raw.githubusercontent.com/MushfiqAziz/ubuntu20/main/lxde19.sh -O /root/lxde19.sh
    bash ~/lxde19.sh
else
    bash ~/lxde19.sh
fi
clear
if [ ! -f /usr/local/bin/vncserver-start ]; then
    wget --tries=20  $dlink/XFCE4/vncserver-start -O /usr/local/bin/vncserver-start 
    wget --tries=20 $dlink/XFCE4/vncserver-stop -O /usr/local/bin/vncserver-stop
    chmod +x /usr/local/bin/vncserver-stop
    chmod +x /usr/local/bin/vncserver-start
fi
if [ ! -f /usr/bin/vncserver ]; then
    apt install tigervnc-standalone-server -y
fi
rm -rf /root/lxde19.sh
rm -rf ~/.bash_profile" > $folder/root/.bash_profile 
clear
bash $bin
