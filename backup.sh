#!/bin/bash

file1="/home/data/backup/"
file2="/Settlingi_THI/bahmni-docker/bahmni-standard/"
date=`date +\%d_\%m_\%Y`


echo " BACKUP FOR openmrsdb  BACKUP FOR openelisdb BACKUP FOR odoodb" 

echo "Taking backup of openmrsdb"
cd $file2
sudo docker compose exec -it openmrsdb sh -c "mysqldump -uroot -padminAdmin!123 openmrs > /openmrsDB_$date.sql"
dockerid=`sudo docker ps | grep -w openmrsdb | awk {'print $1'}`
tr=${dockerid:0:3}
sudo docker cp $tr:/openmrsDB_$date.sql $file1/
sudo docker compose exec -it openmrsdb sh -c "rm openmrsDB*.sql"


sleep 60s

echo "Taking backup of openelisdb"
 

cd $file2
sudo docker compose exec -it openelisdb sh -c "pg_dump -Uclinlims -F p clinlims > /openelisDB_$date.sql"
dockerid=`sudo docker ps | grep -w openelisdb | awk {'print $1'}`
tr=${dockerid:0:3}
sudo docker cp $tr:/openelisDB_$date.sql $file1/
sudo docker compose exec -it openelisdb sh -c "rm openelisDB*.sql"


sleep 60s

echo "Taking backup of odoodb"

cd $file2
docker compose exec -it odoodb sh -c "pg_dump -Uodoo -F p odoo > /odooDB_$date.sql"
dockerid=`sudo docker ps | grep -w odoodb | awk {'print $1'}`
tr=${dockerid:0:3}
sudo docker cp $tr:/odooDB_$date.sql $file1/
sudo docker compose exec -it odoodb sh -c "rm odooDB*.sql"

echo "Backup process completed"


