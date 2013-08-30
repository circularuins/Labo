mysqldump -uroot labo entry > ../sql/backup_entry.sql
cd ../
git add .
git commit -m 'daily backup'