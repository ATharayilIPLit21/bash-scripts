#!/bin/bash

echo "Starting VACUUM ANALYZE on odoo database..."
psql -U odoo -d odoo -c "VACUUM ANALYZE;"

echo "Waiting 5 seconds..."
sleep 5

echo "Starting VACUUM ANALYZE on clinlims database..."
psql -U clinlims -d clinlims -c "VACUUM ANALYZE;"

echo "VACUUM tasks completed."

