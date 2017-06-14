#!/bin/bash

#Ensuring auditd service is installed
if [[ $(dpkg -s auditd 2>&1 | grep "Status: install ok installed") ]]; then
  echo "auditd is installed, no action required..."
else
  echo "installing auditd..."
  sudo apt-get install -y auditd
fi


#Ensuring auditd is configured properly
echo "updating /etc/audit/auditd.conf..."
sudo cat <<EOT > /etc/audit/auditd.conf
#
# This file controls the configuration of the audit daemon
#

log_file = /var/log/audit/audit.log
log_format = RAW
log_group = root
priority_boost = 4
flush = INCREMENTAL
freq = 20
num_logs = 5
disp_qos = lossy
dispatcher = /sbin/audispd
name_format = NONE
##name = mydomain
max_log_file = 6
max_log_file_action = ROTATE
space_left = 75
space_left_action = SYSLOG
action_mail_acct = root
admin_space_left = 50
admin_space_left_action = SUSPEND
disk_full_action = SUSPEND
disk_error_action = SUSPEND
##tcp_listen_port = 
tcp_listen_queue = 5
tcp_max_per_addr = 1
##tcp_client_ports = 1024-65535
tcp_client_max_idle = 0
enable_krb5 = no
krb5_principal = auditd
##krb5_key_file = /etc/audit/audit.key
EOT
sudo service auditd restart
