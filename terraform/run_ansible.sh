#!/bin/bash

LOGFILE="/var/log/my_script.log"

# Fonction pour consigner les erreurs
log_error() {
  echo "$1" | tee -a $LOGFILE
}

# Truncate the known_hosts file
truncate -s 0 /root/.ssh/known_hosts
if [ $? -ne 0 ]; then
  log_error "Failed to truncate /root/.ssh/known_hosts"
fi

# Attendre 20 secondes avant de continuer
sleep 20

# Change directory to the specified path
cd /home/mbureau/Webmason-terraform/ansible/ansible-webmason/WebMason/
if [ $? -ne 0 ]; then
  log_error "Failed to change directory"
fi

# Run the expect script
expect /home/mbureau/Webmason-terraform/terraform/run_playbook_with_password.expect
if [ $? -ne 0 ]; then
  log_error "Failed to execute playbooks"
fi

echo "Script execution completed. Check $LOGFILE for any errors."

