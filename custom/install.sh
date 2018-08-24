#!/bin/bash


BASEPATH=/install/preseed/custom/
touch /root/installed
MACHINE_USERNAME=$1

cp -r  /install/preseed/apts/apt/* /var/cache/apt/. 2>> /root/install.log >> /root/install.log
dpkg -i /install/preseed/apts/apt/archives/*nodm*.deb 2>> /root/install.log >> /root/install.log
apt-get install -y -f

cp $BASEPATH/xsession  /home/$MACHINE_USERNAME/.xsession
cp $BASEPATH/install/x11 /etc/X11/xorg.conf
cp $BASEPATH/nodm.conf /etc/default/nodm
touch /home/$MACHINE_USERNAME/.Xauthority
chown $MACHINE_USERNAME:$MACHINE_USERNAME /home/$MACHINE_USERNAME/.Xauthority





