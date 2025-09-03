#!/bin/bash
# clearlogs-full.sh
# Run as root

LOG_DIR="/var/log"

echo "Truncating all .log and rotated log files..."
# Generic truncation
find $LOG_DIR -type f -name "*.log*" -exec truncate -s 0 {} \;

echo "Truncating rotated logs with -YYYYMMDD or -YYYYMMDD.gz patterns..."
find $LOG_DIR -type f -regex ".*(-[0-9]{6,8}|-[0-9]{6,8}\.gz)$" -exec truncate -s 0 {} \;

echo "Truncating /var/log/sa logs..."
find $LOG_DIR/sa -type f -exec truncate -s 0 {} \;

echo "Truncating large specific files from your listing..."
truncate -s 0 /var/log/anydesk.trace
truncate -s 0 /var/log/boot.log
truncate -s 0 /var/log/messages
truncate -s 0 /var/log/secure
truncate -s 0 /var/log/cron
truncate -s 0 /var/log/yum.log
truncate -s 0 /var/log/Xorg.*.log
truncate -s 0 /var/log/odoocleanup.log
truncate -s 0 /var/log/spooler
truncate -s 0 /var/log/wpa_supplicant.log
truncate -s 0 /var/log/vmware-vmtoolsd-root.log
truncate -s 0 /var/log/vmware-vmusr-root.log
truncate -s 0 /var/log/tallylog

echo "Truncating rotated large files..."
truncate -s 0 /var/log/btmp-*
truncate -s 0 /var/log/secure-*
truncate -s 0 /var/log/messages-*
truncate -s 0 /var/log/cron-*

echo "Clearing special binary logs..."
> /var/log/btmp
> /var/log/wtmp
> /var/log/lastlog

echo "Clearing audit logs..."
> /var/log/audit/audit.log

echo "All logs cleared successfully."




