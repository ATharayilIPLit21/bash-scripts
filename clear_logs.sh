#!/bin/bash
truncate -s 0 /var/log/bahmni-installer/bahmni-installer.log
truncate -s 0 /var/log/httpd/ssl_request_log
truncate -s 0 /var/log/httpd/ssl_access_log
truncate -s 0 /var/log/pgbackrest/bahmni-postgres-backup.log
truncate -s 0 /var/log/odoo/odoo.log
truncate -s 0 /opt/bahmni-lab/log/bahmni-lab.log

rm -f /var/log/httpd/ssl_request_log-*
rm -f /var/log/httpd/ssl_access_log-*
rm -f /var/log/messages-*
rm -f /var/log/maillog-*

rm -f /var/log/httpd/access_log.*
rm -f /var/log/httpd/error_log-*
rm -f /var/log/httpd/ssl_error_log-*

sudo yum clean all