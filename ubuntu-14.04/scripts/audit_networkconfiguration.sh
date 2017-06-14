#!/bin/bash


#Ensure source routed packets are not accepted
if sysctl net.ipv4.conf.all.accept_source_route 2>&1 | grep -v '= 0'; then
  echo "disabling system from accepting source routed packets..."
  if grep -v '^ *#' /etc/sysctl.conf  | grep "net.ipv4.conf.all.accept_source_route"; then
    sudo sed -i '/net.ipv4.conf.all.accept_source_route/c\net.ipv4.conf.all.accept_source_route=0' /etc/sysctl.conf
  else
    sudo /bin/sh -c 'echo "net.ipv4.conf.all.accept_source_route=0" >> /etc/sysctl.conf' 
  fi
  sudo sysctl -w net.ipv4.conf.all.accept_source_route=0
fi

if sysctl net.ipv4.conf.default.accept_source_route 2>&1 | grep -v '= 0'; then
  echo "disabling system from accepting source routed packets..."
  if grep -v '^ *#' /etc/sysctl.conf  | grep "net.ipv4.conf.default.accept_source_route"; then
    sudo sed -i '/net.ipv4.conf.default.accept_source_route/c\net.ipv4.conf.default.accept_source_route=0' /etc/sysctl.conf
  else
    sudo /bin/sh -c 'echo "net.ipv4.conf.default.accept_source_route=0" >> /etc/sysctl.conf'
  fi
  sudo sysctl -w net.ipv4.conf.default.accept_source_route=0
fi


#Ensure ICMP redirects are not accepted
if sysctl net.ipv4.conf.all.accept_redirects 2>&1 | grep -v '= 0'; then
  echo "disabling system from accepting source routed packets..."
  if grep -v '^ *#' /etc/sysctl.conf  | grep "net.ipv4.conf.all.accept_redirects"; then
    sudo sed -i '/net.ipv4.conf.all.accept_redirects/c\net.ipv4.conf.all.accept_redirects=0' /etc/sysctl.conf
  else
    sudo /bin/sh -c 'echo "net.ipv4.conf.all.accept_redirects=0" >> /etc/sysctl.conf'
  fi
  sudo sysctl -w net.ipv4.conf.all.accept_redirects=0
fi

if sysctl net.ipv4.conf.default.accept_redirects 2>&1 | grep -v '= 0'; then
  echo "disabling system from accepting source routed packets..."
  if grep -v '^ *#' /etc/sysctl.conf  | grep "net.ipv4.conf.default.accept_redirects"; then
    sudo sed -i '/net.ipv4.conf.default.accept_redirects/c\net.ipv4.conf.default.accept_redirects=0' /etc/sysctl.conf
  else
    sudo /bin/sh -c 'echo "net.ipv4.conf.default.accept_redirects=0" >> /etc/sysctl.conf'
  fi
  sudo sysctl -w net.ipv4.conf.default.accept_redirects=0
fi


#Ensure secure ICMP redirects are not accepted
if sysctl net.ipv4.conf.all.secure_redirects 2>&1 | grep -v '= 0'; then
  echo "disabling system from accepting source routed packets..."
  if grep -v '^ *#' /etc/sysctl.conf  | grep "net.ipv4.conf.all.secure_redirects"; then
    sudo sed -i '/net.ipv4.conf.all.secure_redirects/c\net.ipv4.conf.all.secure_redirects=0' /etc/sysctl.conf
  else
    sudo /bin/sh -c 'echo "net.ipv4.conf.all.secure_redirects=0" >> /etc/sysctl.conf'
  fi
  sudo sysctl -w net.ipv4.conf.all.secure_redirects=0
fi

if sysctl net.ipv4.conf.default.secure_redirects 2>&1 | grep -v '= 0'; then
  echo "disabling system from accepting source routed packets..."
  if grep -v '^ *#' /etc/sysctl.conf  | grep "net.ipv4.conf.default.secure_redirects"; then
    sudo sed -i '/net.ipv4.conf.default.secure_redirects/c\net.ipv4.conf.default.secure_redirects=0' /etc/sysctl.conf
  else
    sudo /bin/sh -c 'echo "net.ipv4.conf.default.secure_redirects=0" >> /etc/sysctl.conf'
  fi
  sudo sysctl -w net.ipv4.conf.default.secure_redirects=0
fi


#Ensure suspicious packets are logged
if sysctl net.ipv4.conf.all.log_martians 2>&1 | grep -v '= 1'; then
  echo "disabling system from accepting source routed packets..."
  if grep -v '^ *#' /etc/sysctl.conf  | grep "net.ipv4.conf.all.log_martians"; then
    sudo sed -i '/net.ipv4.conf.all.log_martians/c\net.ipv4.conf.all.log_martians=1' /etc/sysctl.conf
  else
    sudo /bin/sh -c 'echo "net.ipv4.conf.all.log_martians=1" >> /etc/sysctl.conf'
  fi
  sudo sysctl -w net.ipv4.conf.all.log_martians=1
fi

if sysctl net.ipv4.conf.default.log_martians 2>&1 | grep -v '= 1'; then
  echo "disabling system from accepting source routed packets..."
  if grep -v '^ *#' /etc/sysctl.conf  | grep "net.ipv4.conf.default.log_martians"; then
    sudo sed -i '/net.ipv4.conf.default.log_martians/c\net.ipv4.conf.default.log_martians=1' /etc/sysctl.conf
  else
    sudo /bin/sh -c 'echo "net.ipv4.conf.default.log_martians=1" >> /etc/sysctl.conf'
  fi
  sudo sysctl -w net.ipv4.conf.default.log_martians=1
fi


#Ensure broadcast ICMP requests are ignored
if sysctl net.ipv4.icmp_echo_ignore_broadcasts 2>&1 | grep -v '= 1'; then
  echo "disabling system from accepting source routed packets..."
  if grep -v '^ *#' /etc/sysctl.conf  | grep "net.ipv4.icmp_echo_ignore_broadcasts"; then
    sudo sed -i '/net.ipv4.icmp_echo_ignore_broadcasts/c\net.ipv4.icmp_echo_ignore_broadcasts=1' /etc/sysctl.conf
  else
    sudo /bin/sh -c 'echo "net.ipv4.icmp_echo_ignore_broadcasts=1" >> /etc/sysctl.conf'
  fi
  sudo sysctl -w net.ipv4.icmp_echo_ignore_broadcasts=1
fi


#Ensure bogus ICMP responses are ignored
if sysctl net.ipv4.icmp_ignore_bogus_error_responses 2>&1 | grep -v '= 1'; then
  echo "disabling system from accepting source routed packets..."
  if grep -v '^ *#' /etc/sysctl.conf  | grep "net.ipv4.icmp_ignore_bogus_error_responses"; then
    sudo sed -i '/net.ipv4.icmp_ignore_bogus_error_responses/c\net.ipv4.icmp_ignore_bogus_error_responses=1' /etc/sysctl.conf
  else
    sudo /bin/sh -c 'echo "net.ipv4.icmp_ignore_bogus_error_responses=1" >> /etc/sysctl.conf'
  fi
  sudo sysctl -w net.ipv4.icmp_ignore_bogus_error_responses=1
fi


#Ensure Reverse Path Filtereing is enabled
if sysctl net.ipv4.conf.all.rp_filter 2>&1 | grep -v '= 0'; then
  echo "disabling system from accepting source routed packets..."
  if grep -v '^ *#' /etc/sysctl.conf  | grep "net.ipv4.conf.all.rp_filter"; then
    sudo sed -i '/net.ipv4.conf.all.rp_filter/c\net.ipv4.conf.all.rp_filter=0' /etc/sysctl.conf
  else
    sudo /bin/sh -c 'echo "net.ipv4.conf.all.rp_filter=0" >> /etc/sysctl.conf'
  fi
  sudo sysctl -w net.ipv4.conf.all.rp_filter=0
fi

if sysctl net.ipv4.conf.default.rp_filter 2>&1 | grep -v '= 0'; then
  echo "disabling system from accepting source routed packets..."
  if grep -v '^ *#' /etc/sysctl.conf  | grep "net.ipv4.conf.default.rp_filter"; then
    sudo sed -i '/net.ipv4.conf.default.rp_filter/c\net.ipv4.conf.default.rp_filter=0' /etc/sysctl.conf
  else
    sudo /bin/sh -c 'echo "net.ipv4.conf.default.rp_filter=0" >> /etc/sysctl.conf'
  fi
  sudo sysctl -w net.ipv4.conf.default.rp_filter=0
fi


#Ensure TCP SYN Cookies is enabled
if sysctl net.ipv4.tcp_syncookies 2>&1 | grep -v '= 1'; then
  echo "disabling system from accepting source routed packets..."
  if grep -v '^ *#' /etc/sysctl.conf  | grep "net.ipv4.tcp_syncookies"; then
    sudo sed -i '/net.ipv4.tcp_syncookies/c\net.ipv4.tcp_syncookies=1' /etc/sysctl.conf
  else
    sudo /bin/sh -c 'echo "net.ipv4.tcp_syncookies=1" >> /etc/sysctl.conf'
  fi
  sudo sysctl -w net.ipv4.tcp_syncookies=1
fi


#Ensure IPv6 router advertisements are not accepted
if sysctl net.ipv6.conf.all.accept_ra 2>&1 | grep -v '= 0'; then
  echo "disabling system from accepting source routed packets..."
  if grep -v '^ *#' /etc/sysctl.conf  | grep "net.ipv6.conf.all.accept_ra"; then
    sudo sed -i '/net.ipv6.conf.all.accept_ra/c\net.ipv6.conf.all.accept_ra=0' /etc/sysctl.conf
  else
    sudo /bin/sh -c 'echo "net.ipv6.conf.all.accept_ra=0" >> /etc/sysctl.conf'
  fi
  sudo sysctl -w net.ipv6.conf.all.accept_ra=0
fi

if sysctl net.ipv6.conf.default.accept_ra 2>&1 | grep -v '= 0'; then
  echo "disabling system from accepting source routed packets..."
  if grep -v '^ *#' /etc/sysctl.conf  | grep "net.ipv6.conf.default.accept_ra"; then
    sudo sed -i '/net.ipv6.conf.default.accept_ra/c\net.ipv6.conf.default.accept_ra=0' /etc/sysctl.conf
  else
    sudo /bin/sh -c 'echo "net.ipv6.conf.default.accept_ra=0" >> /etc/sysctl.conf'
  fi
  sudo sysctl -w net.ipv6.conf.default.accept_ra=0
fi


#Ensure IPv6 redirects are not accepted
if sysctl net.ipv6.conf.all.accept_redirects 2>&1 | grep -v '= 0'; then
  echo "disabling system from accepting source routed packets..."
  if grep -v '^ *#' /etc/sysctl.conf  | grep "net.ipv6.conf.all.accept_redirects"; then
    sudo sed -i '/net.ipv6.conf.all.accept_redirects/c\net.ipv6.conf.all.accept_redirects=0' /etc/sysctl.conf
  else
    sudo /bin/sh -c 'echo "net.ipv6.conf.all.accept_redirects=0" >> /etc/sysctl.conf'
  fi
  sudo sysctl -w net.ipv6.conf.all.accept_redirects=0
fi

if sysctl net.ipv6.conf.default.accept_redirects 2>&1 | grep -v '= 0'; then
  echo "disabling system from accepting source routed packets..."
  if grep -v '^ *#' /etc/sysctl.conf  | grep "net.ipv6.conf.default.accept_redirects"; then
    sudo sed -i '/net.ipv6.conf.default.accept_redirects/c\net.ipv6.conf.default.accept_redirects=0' /etc/sysctl.conf
  else
    sudo /bin/sh -c 'echo "net.ipv6.conf.default.accept_redirects=0" >> /etc/sysctl.conf'
  fi
  sudo sysctl -w net.ipv6.conf.default.accept_redirects=0
fi


sudo sysctl -w net.ipv4.route.flush=1
sudo sysctl -w net.ipv6.route.flush=1

#Ensure IPv6 is disabled
echo "disabling ipv6..."
if grep -v '^ *#' /etc/default/grub | grep "GRUB_CMDLINE_LINUX=\"ipv6.disable"; then
  sudo sed -i '/GRUB_CMDLINE_LINUX=\"ipv6.disable/c\GRUB_CMDLINE_LINUX=\"ipv6.disable=1\"' /etc/default/grub
else
  sudo /bin/sh -c 'echo "GRUB_CMDLINE_LINUX=\"ipv6.disable=1\"" >> /etc/default/grub'
fi
sudo update-grub



#Ensure TCP Wrappers is installed
if [[ $(dpkg -s tcpd 2>&1 | grep "Status: install ok installed") ]]; then
  echo "tcpd is installed, no action required..."
else 
  echo "installing tcpd..."
  sudo apt-get install -y tcpd
fi



#Ensuring permissions on /etc/hosts.allow and /etc/hosts.deny are 644
sudo chown root:root /etc/hosts.allow
sudo chmod 644 /etc/hosts.allow
sudo chown root:root /etc/hosts.deny
sudo chmod 644 /etc/hosts.deny

