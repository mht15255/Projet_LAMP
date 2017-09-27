#!/bin/bash

groupadd admin
useradd -g admin -d /home/admin -m -c "admin" -p admin -s /bin/bash admin

usermod -a -G admin admin


chgrp -R admin /sauvegarde
chown -R admin /sauvegarde
