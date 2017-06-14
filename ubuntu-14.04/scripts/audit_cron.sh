#!/bin/bash


#Ensuring cron daemon is enabled
if /sbin/initctl show-config cron 2>&1 | grep 'start on runlevel \[2345\]'; then
  echo "proper start conditions for cron service detected..."
else
  echo "editing start lines for /etc/init/cron.conf..."
  sudo sed -i '/start/c\start on runlevel [2345]' /etc/init/cron.conf
fi


#Ensuring permmisions for /etc/crontab are configured
sudo chown root:root /etc/crontab
sudo chmod og-rwx /etc/crontab


#Ensuring permmisions for /etc/cron.hourly are configured
sudo chown root:root /etc/cron.hourly
sudo chmod og-rwx /etc/cron.hourly


#Ensuring permmisions for /etc/cron.daily are configured
sudo chown root:root /etc/cron.daily
sudo chmod og-rwx /etc/cron.daily


#Ensuring permmisions for /etc/cron.weekly are configured
sudo chown root:root /etc/cron.weekly
sudo chmod og-rwx /etc/cron.weekly


#Ensuring permmisions for /etc/cron.monthly are configured
sudo chown root:root /etc/cron.monthly
sudo chmod og-rwx /etc/cron.monthly


#Ensuring permmisions for /etc/cron.d are configured
sudo chown root:root /etc/cron.d
sudo chmod og-rwx /etc/cron.d


#Ensuring cron is restricted to authorized users
sudo rm /etc/cron.deny
sudo rm /etc/at.deny
sudo touch /etc/cron.allow
sudo touch /etc/at.allow
sudo chmod og-rwx /etc/cron.allow
sudo chmod og-rwx /etc/at.allow
sudo chown root:root /etc/cron.allow
sudo chown root:root /etc/at.allow



