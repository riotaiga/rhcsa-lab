#!/bin/bash
set -e

# Create groups in office style 
groupadd devs
groupadd operations         # manages infrastructure and deployment
groupadd hr
groupadd sales

# Creating the users and assign them to specific groups and provide temp passwd
useradd -m -s /bin/bash -G devs devuser
echo "devuser:DevPass123" | chpasswd

useradd -m -s /bin/bash -G operations opsuser
echo "opsuser:OpsPass123" | chpasswd

useradd -m -s /bin/bash -G hr hruser
echo "hruser:HrPass123" | chpasswd

useradd -m -s /bin/bash -G sales salesuser
echo "salesuser:SalesPass123" | chpasswd

# Have the users change their password on first login and set password expiration policies
chage -d 0 devuser     # force password change on first login
chage -M 180 devuser    # max 100 days and change passwd again
chage -d 0 opsuser     # force password change on first login
# chage -m 7 devuser     # min 7 days
# chage -W 5 devuser     # 5 days warning

# echo "----- Creating Custom User with UID/GID/Shell -----"
# useradd -u 2001 -g devs -s /bin/zsh -m customdev
# echo "customdev:Custom123" | chpasswd

# Provide developers to access sudo without password
echo "devuser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/devuser

# Allow operations group to run only systemctl 
echo "%operations ALL=(ALL) NOPASSWD: /bin/systemctl" > /etc/sudoers.d/operations-group

chmod 0440 /etc/sudoers.d/*

echo "----- Lab Ready: Users, Groups, Policies Configured -----"
