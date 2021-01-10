#!/bin/bash
sudo apt-mark hold udisks2
sudo apt-get update
sudo apt-get install keyboard-configuration -y
sudo apt-get install tzdata -y
sudo apt-get install sudo wget nano inetutils-tools dialog -y
sudo apt-get install lxde-core lxterminal tigervnc-standalone-server tigervnc-common dbus-x11 --no-install-recommends -y
sudo apt-get clean
mkdir -p ~/.vnc
echo "#!/bin/bash
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
export PULSE_SERVER=127.0.0.1
XAUTHORITY=$HOME/.Xauthority
export XAUTHORITY                                                         
LANG=en_US.UTF-8
export LANG
echo $$ > /tmp/xsession.pid
dbus-launch --exit-with-session startlxde &" > ~/.vnc/xstartup
vncpasswd
vncserver-start
