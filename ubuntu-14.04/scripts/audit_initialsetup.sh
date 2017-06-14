#!/bin/bash

#Access should be 644, Uid and Gid should be 0

sudo /bin/sh -c 'echo "This system is owned by IMDA. All activities are being monitored. Unauthorized access or activity will be reported." > /etc/motd'
cat /etc/motd
egrep '(\\v|\\r|\\m|\\s)' /etc/motd
sudo chown root:root /etc/motd
sudo chmod 644 /etc/motd

cat /etc/issue
egrep '(\\v|\\r|\\m|\\s)' /etc/issue
sudo chown root:root /etc/issue
sudo chmod 644 /etc/issue

cat /etc/issue.net
egrep '(\\v|\\r|\\m|\\s)' /etc/issue.net
sudo chown root:root /etc/issue.net
sudo chmod 644 /etc/issue.net


stat /etc/motd
stat /etc/issue
stat /etc/issue.net

apt-get -s upgrade
