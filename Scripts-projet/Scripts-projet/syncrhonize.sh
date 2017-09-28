#!/bin/bash

#Pour toute question : mustafa.aljawhari@hotmail.fr

# Installation de rsync
yum install rsync

#evoie de la commande d'exportation de la BDD vers mysqldump.sh qui sera par la suite executé par crontab
echo 'mysqldump -u root libautodb | bzip2 -c > /sauvegarde/BDD/libautodb$(date +%Y-%m-%d-%H.%M.%S).sql.bz2'>> /sauvegarde/BDD/mysqldump.sh
chmod 770 /sauvegarde/BDD/mysqldump.sh


#ajout de la commande d'execution du script sh dans crontab
crontab -l > /tmp/macrontab
echo "00 01 * * * /sauvegarde/BDD/mysqldump.sh" >> /tmp/macrontab
crontab < /tmp/macrontab

#commande de synchronisation envoyé dans le script syncdistant.sh qui sera par la suite executé par crontab
echo 'rsync  bzip2 -c -avz /var/www/html/ /sauvegarde/Applications/backup$(date +%Y-%m-%d-%H.%M.%S).bz2' >> /sauvegarde/Applications/synchlocal.sh
chmod 770 /sauvegarde/Applications/synchlocal.sh

#ajout de la commande d'execution du script sh dans crontab
crontab -l > /tmp/macrontab2
echo "00 02 * * * /sauvegarde/Applications/synchlocal.sh" >> /tmp/macrontab2
crontab < /tmp/macrontab2

# procédure seulement la 1ère foix pour ne pas avoir besoin de rentrer le mot de passe
#génération de la clé
ssh-keygen

#ssh-copy-id copies public key to remote host
ssh-copy-id -i ~/.ssh/id_rsa.pub 192.168.1.145
# mot de pass de la machine distante est 2secure  (attention la clavier est un QWERTY)

#commande de synchronisation envoyé dans le script syncdistant.sh qui sera par la suite executé par crontab
echo 'rsync bzip2 -c -avz -e ssh /sauvegarde root@192.168.1.145:/sauvegarde-distant/backup-distant$(date +%Y-%m-%d-%H.%M.%S).bz2' >> /sauvegarde/synchdistant.sh
chmod 770 /sauvegarde/synchdistant.sh

#ajout de la commande d'execution du script sh dans crontab
crontab -l > /tmp/macrontab2
echo "00 04 * * * /sauvegarde/synchdistant.sh" >> /tmp/macrontab2
crontab < /tmp/macrontab2
