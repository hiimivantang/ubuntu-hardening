#!/bin/bash


#Ensure PAM is installed
sudo apt-get install -y libpam-pwquality


#Ensure lockout for 100 failed password attemps is configured
echo "locking out user IDs after 100 unsuccessful consecutive login attempts..."
if grep -v '^ *#' /etc/pam.d/common-auth | grep "auth required pam_tally2.so"; then
  sudo sed -i '/auth required pam_tally2.so/c\auth required pam_tally2.so onerr=fail audit silent deny=100 unlock_time=900' /etc/pam.d/common-auth
else
  sudo /bin/sh -c 'echo "auth required pam_tally2.so onerr=fail audit silent deny=100 unlock_time=900" >> /etc/pam.d/common-auth'
fi

