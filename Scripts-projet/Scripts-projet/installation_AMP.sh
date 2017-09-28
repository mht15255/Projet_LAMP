#!/bin/bash
#Pour toute question : mustafa.aljawhari@hotmail.fr


#installation d'apache, mysql et php servers
(echo "y") | yum install httpd php php-mysql mariadb-server mariadb php-gd php-pdo -y

#ajout d'une exeption permanente pour apache dans le firewall
firewall-cmd --permanent --zone=public --add-service=http
firewall-cmd --reload

#permettre le démérrage de serveur de la BDD et d'apache
systemctl enable httpd.service
systemctl enable mariadb.service


# démarrage
systemctl start httpd.service
systemctl start mariadb.service

# pour que mysql ne soit pas sensible à la casse
echo "[mysql]
prompt = \u$\d>
[mysqld]
lower_case_table_names = 1
innodb_fast_shutdown = 0
transaction-isolation=READ-COMMITTED" >> /etc/my.cnf

#rédemarrage de service de la BDD
systemctl restart mariadb.service

#changement de groupe et utilisateur pour mysql
chgrp mysql /var/lib/mysql
chown mysql /var/lib/mysql
