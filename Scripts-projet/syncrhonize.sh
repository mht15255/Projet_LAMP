#!/bin/bash

# Installation de rsync
yum install rsync

#
echo 'mysqldump -u root mangasdb | bzip2 -c > /sauvegarde/BDD/mangasdb$(date +%Y-%m-%d-%H.%M.%S).sql.bz2'>> /sauvegarde/BDD/mysqldump.sh
chmod 770 /sauvegarde/BDD/mysqldump.sh

crontab -l > /tmp/macrontab
echo "44 20 * * * /sauvegarde/BDD/mysqldump.sh" >> /tmp/macrontab
crontab < /tmp/macrontab


echo 'rsync  bzip2 -c -avz /var/www/html/ /sauvegarde/Applications/backup$(date +%Y-%m-%d-%H.%M.%S).bz2' >> /sauvegarde/Applications/synchlocal.sh
chmod 770 /sauvegarde/Applications/synchlocal.sh
crontab -l > /tmp/macrontab2
echo "44 20 * * * /sauvegarde/Applications/synchlocal.sh" >> /tmp/macrontab2
crontab < /tmp/macrontab2

# procédure seulement la 1ère foix pour ne pas avoir besoin de rentrer le mot de passe
ssh-keygen
ssh-copy-id -i ~/.ssh/id_rsa.pub 192.168.1.145
# mot de pass de la machine distante est 2secure  (attention la clavier est un QWERTY)

echo 'rsync bzip2 -c -avz -e ssh /sauvegarde root@192.168.1.145:/sauvegarde-distant/backup-distant$(date +%Y-%m-%d-%H.%M.%S).bz2' >> /sauvegarde/synchdistant.sh
chmod 770 /sauvegarde/synchdistant.sh
crontab -l > /tmp/macrontab2
echo "44 20 * * * /sauvegarde/synchdistant.sh" >> /tmp/macrontab2
crontab < /tmp/macrontab2
