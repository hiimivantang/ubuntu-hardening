# ubuntu-hardening
this project contains hardening scripts for ubuntu. 
<br>
<br>

# audit_initialsetup.sh
<br>

* Ensure source routed packets are not accepted
* Ensure ICMP redirects are not accepted
* Ensure secure ICMP redirects are not accepted
* Ensure suspicious packets are logged
* Ensure broadcast ICMP requests are ignored
* Ensure bogus ICMP responses are ignored
* Ensure Reverse Path Filtereing is enabled
* Ensure TCP SYN Cookies is enabled
* Ensure IPv6 router advertisements are not accepted
* Ensure IPv6 redirects are not accepted
* Ensure IPv6 is disabled
* Ensure TCP Wrappers is installed
* Ensuring permissions on /etc/hosts.allow and /etc/hosts.deny are 644

<br>
<br>

# audit_specialpurposeservices.sh
<br>

* Ensure ntp is configured
* Ensure X Window System in not installed
* Ensure Avahi Server is not enabled
* Ensure CUPS is not enabled
* Ensure DHCP Server is not enabled
* Ensure LDAP Server is not enabled
* Ensure NFS and RPC are not enabled
* Ensure DNS Server is not enabled
* Ensure FTP Server is not enabled
* Ensure HTTP Server is not enabled
* Ensure IMAP and POP3 server is not enabled
* Ensure Sambe is not enabled
* Ensure HTTP Proxy Server is not enabled
* Ensure SNMP Server is not enabled
* Ensure rsync service is not enabled
* Ensure NIS Server is not enabled
* Ensure NIS client is not installed
* Ensure rsh client is not installed
* Ensure talk client is not installed
* Ensure telnet client is not installed
* Ensure LDAP client is not installed

<br>
<br>

# audit_networkconfiguration.sh
<br>

* Ensure source routed packets are not accepted
* Ensure ICMP redirects are not accepted
* Ensure secure ICMP redirects are not accepted
* Ensure suspicious packets are logged
* Ensure broadcast ICMP requests are ignored
* Ensure bogus ICMP responses are ignored
* Ensure Reverse Path Filtereing is enabled
* Ensure TCP SYN Cookies is enabled
* Ensure IPv6 router advertisements are not accepted
* Ensure IPv6 redirects are not accepted
* Ensure IPv6 is disabled
* Ensure TCP Wrappers is installed
* Ensuring permissions on /etc/hosts.allow and /etc/hosts.deny are 644

<br>
<br>

# audit_systemaccounting.sh
<br>

* Ensuring auditd service is installed
* Ensuring auditd is configured properly

<br>
<br>

# audit_cron.sh
<br>

* Ensuring cron daemon is enabled
* Ensuring permmisions for /etc/crontab are configured
* Ensuring permmisions for /etc/cron.hourly are configured
* Ensuring permmisions for /etc/cron.daily are configured
* Ensuring permmisions for /etc/cron.weekly are configured
* Ensuring permmisions for /etc/cron.monthly are configured
* Ensuring permmisions for /etc/cron.d are configured
* Ensuring cron is restricted to authorized users
<br>
<br>

# audit_sshconfiguration.sh
<br>

* Ensure permissions on /etc/ssh/sshd_config are configured
* Ensure SSH Server configuration is configured properly
* Ensure only approved MAC algorithms are used

<br>
<br>

# audit_pamconfiguration.sh
<br>

* Ensure PAM is installed
* Ensure lockout for 100 failed password attemps is configured
