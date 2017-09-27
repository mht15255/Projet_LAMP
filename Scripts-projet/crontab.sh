#!/bin/bash

rsync -av
0 8 * * * rsync -av /var/lib/mysql/* /sauvegarde/BDD/
