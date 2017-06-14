#!/bin/bash

#Ensure ntp is configured
sudo apt-get install ntp -y
grep "^restrict" /etc/ntp.conf
grep "^server" /etc/ntp.conf
grep "RUNASUSER=ntp" /etc/init.d/ntp


#Ensure X Window System in not installed
sudo apt-get remove -y xserver-xorg*


#Ensure Avahi Server is not enabled
if initctl show-config avahi-daemon 2>&1 | grep 'start on'; then
  echo "commenting out start lines for /etc/init/avahi-daemon.conf..."
  sudo sed -e '/start/ s/^#*/#/' -i /etc/init/avahi-daemon.conf
  sudo initctl stop avahi-daemon
fi


#Ensure CUPS is not enabled
if initctl show-config cups 2>&1 | grep 'start on'; then
  echo "commenting out start lines for /etc/init/cups.conf..."
  sudo sed -e '/start/ s/^#*/#/' -i /etc/init/cups.conf
  sudo initctl stop cups
fi


#Ensure DHCP Server is not enabled
if initctl show-config isc-dhcp-server 2>&1| grep 'start on'; then
  echo "commenting out start lines for /etc/init/isc-dhcp-server.conf..."
  sudo sed -e '/start/ s/^#*/#/' -i /etc/init/isc-dhcp-server.conf
  sudo initctl stop isc-dhcp-server
fi

if initctl show-config isc-dhcp-server6 2>&1| grep 'start on'; then
  echo "commenting out start lines for /etc/init/isc-dhcp-server6.conf..."
  sudo sed -e '/start/ s/^#*/#/' -i /etc/init/isc-dhcp-server6.conf
  sudo initctl stop isc-dhcp-server6
fi


#Ensure LDAP Server is not enabled
if [[ $(ls /etc/rc*.d/S*slapd) ]]; then
  echo "start links for slapd found..."
  sudo update-rc.d slapd disable
else
  echo "no start links for slapd found..."
fi


#Ensure NFS and RPC are not enabled
if [[ $(ls /etc/rc*.d/S*nfs-kernel-server) ]]; then
  echo "start links for nfs-kernel-server found..."
  sudo update-rc.d nfs-kernel-server disable
else
  echo "no start links for nfs-kernel-server found..."
fi

if initctl show-config rpcbind 2>&1| grep 'start on'; then
  echo "commenting out start lines for /etc/init/rpcbind.conf..."
  sudo sed -e '/start/ s/^#*/#/' -i /etc/init/rpcbind.conf
  sudo initctl stop rpcbind
fi


#Ensure DNS Server is not enabled
if [[ $(ls /etc/rc*.d/S*bind9) ]]; then
  echo "start links for bind9 found..."
  update-rc.d bind9 disable
else
  echo "no start links for bind9 found..."
fi 


#Ensure FTP Server is not enabled
if initctl show-config vsftpd 2>&1 | grep 'start on'; then
  echo "commenting out start lines for /etc/init/vsftpd.conf..."
  sudo sed -e '/start/ s/^#*/#/' -i /etc/init/vsftpd.conf
  sudo initctl stop vsftpd
fi


#Ensure HTTP Server is not enabled
if [[ $(ls /etc/rc*.d/S*apache2) ]]; then
  echo "start links for apache2 found, removing start links..."
  sudo update-rc.d apache2 disable
else
  echo "no start links for apache2 found..."
fi


#Ensure IMAP and POP3 server is not enabled
if initctl show-config dovecot 2>&1 | grep 'start on'; then
  echo "commenting out start lines for /etc/init/dovecot.conf..."
  sudo sed -e '/start/ s/^#*/#/' -i /etc/init/dovecot.conf
  sudo initctl stop dovecot
fi


#Ensure Sambe is not enabled
if initctl show-config smbd 2>&1 | grep 'start on'; then
  echo "commenting out start lines for /etc/init/smbd.conf..."
  sudo sed -e '/start/ s/^#*/#/' -i /etc/init/smbd.conf
  sudo initctl stop smbd
fi


#Ensure HTTP Proxy Server is not enabled
if initctl show-config squid3 2>&1 | grep 'start on'; then
  echo "commenting out start lines for /etc/init/squid3.conf..."
  sudo sed -e '/start/ s/^#*/#/' -i /etc/init/squid3.conf
  sudo initctl stop squid3
fi


#Ensure SNMP Server is not enabled
if [[ $(ls /etc/rc*.d/S*snmpd) ]]; then
  echo "start links for snmpd found, removing start links..."
  update-rc.d snmpd disable
else
  echo "no start links for snmpd found..."
fi


#Ensure rsync service is not enabled
if [[ $(grep ^RSYNC_ENABLE /etc/default/rsync | grep 'true\|inetd') ]]; then
  echo "rsync service is enabled, disabling it now..."
  sudo sed -i '/RSYNC_ENABLE/c\RSYNC_ENABLE=false' /etc/default/rsync
fi


#Ensure NIS Server is not enabled
if initctl show-config ypserv 2>&1 | grep 'start on'; then
  echo "commenting out start lines for /etc/init/ypserv.conf..."
  sudo sed -e '/start/ s/^#*/#/' -i /etc/init/ypserv.conf
  sudo initctl stop ypserv
fi


#Ensure NIS client is not installed
if [[ $(dpkg -s nis 2>&1 | grep "Status: install ok installed") ]]; then
  echo "nis service found, uninstalling now...."
  sudo apt-get remove nis -y
fi


#Ensure rsh client is not installed
if [[ $(dpkg -s rsh-client 2>&1 | grep "Status: install ok installed") ]]; then
  echo "rsh-client service found, uninstalling now...."
  sudo apt-get remove rsh-client -y
fi

if [[ $(dpkg -s rsh-redone-client 2>&1 | grep "Status: install ok installed") ]]; then
  echo "rsh-redone-client service found, uninstalling now...."
  sudo apt-get remove rsh-redone-client -y
fi


#Ensure talk client is not installed
if [[ $(dpkg -s talk 2>&1 | grep "Status: install ok installed") ]]; then
  echo "talk service found, uninstalling now...."
  sudo apt-get remove talk -y
fi


#Ensure telnet client is not installed
if [[ $(dpkg -s telnet 2>&1 | grep "Status: install ok installed") ]]; then
  echo "telnet service found, uninstalling now...."
  sudo apt-get remove telnet -y
fi


#Ensure LDAP client is not installed
if [[ $(dpkg -s ldap-utils 2>&1 | grep "Status: install ok installed") ]]; then
  echo "ldap-utils service found, uninstalling now...."
  sudo apt-get remove ldap-utils -y
fi
