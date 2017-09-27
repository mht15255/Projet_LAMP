#!/bin/bash

(echo "y") | mdadm --create /dev/md0 --level=raid1 --raid-devices=2 /dev/sdc /dev/sdd
(echo "y") | mdadm --create /dev/md1 --level=raid1 --raid-devices=2 /dev/sde /dev/sdf
(echo "y") | mdadm --create /dev/md2 --level=raid0 --raid-devices=2 /dev/md0 /dev/md1

echo -e " \n \n "
echo "RAID10 sur md2 termine"
echo -e " \n \n "

(echo "y") | mdadm --create /dev/md3 --level=raid1 --raid-devices=2 /dev/sdg /dev/sdh
(echo "y") | mdadm --create /dev/md4 --level=raid1 --raid-devices=2 /dev/sdi /dev/sdj
(echo "y") | mdadm --create /dev/md5 --level=raid0 --raid-devices=2 /dev/md3 /dev/md4

echo -e " \n \n "
echo "RAID10 sur md5 termine"
echo -e " \n \n "

(echo "y") | mdadm --create /dev/md6 --level=raid5 --raid-devices=3 /dev/sdk /dev/sdl /dev/sdm --spare-devices=1 /dev/sdn

echo -e " \n \n "
echo "RAID5 sur md6 termine"
echo -e " \n \n "

mkfs.xfs /dev/md2
mkfs.xfs /dev/md5
mkfs.xfs /dev/md6

mkdir  /var/lib/mysql
mkdir -p /var/www/html
mkdir -p /sauvegarde


echo "/dev/md2        /var/lib/mysql  xfs     defaults        0       0" >> /etc/fstab
echo "/dev/md5        /var/www/html   xfs     defaults        0       0" >> /etc/fstab
echo "/dev/md6        /sauvegarde  xfs     defaults        0       0" >> /etc/fstab


mount -a
echo "montage termine"
mkdir -p /sauvegarde/BDD
touch /sauvegarde/BDD/mysqldump.sh
mkdir -p /sauvegarde/Applications
mkdir -p /sauvegarde/Applications/app_concassionnaire
mkdir -p /sauvegarde/Applications/app_prestataire
