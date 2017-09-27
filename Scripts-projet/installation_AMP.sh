#!/bin/bash

(echo "y") | yum install httpd php php-mysql mariadb-server mariadb php-gd php-pdo -y

firewall-cmd --permanent --zone=public --add-service=http
firewall-cmd --reload


systemctl enable httpd.service
systemctl enable mariadb.service



systemctl start httpd.service
systemctl start mariadb.service

echo "[mysql]
prompt = \u$\d>
[mysqld]
lower_case_table_names = 1
innodb_fast_shutdown = 0
transaction-isolation=READ-COMMITTED" >> /etc/my.cnf

systemctl restart mariadb.service
