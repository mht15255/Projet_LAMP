#!/bin/bash

yum install rsync
wget ftp://195.220.108.108/linux/dag/redhat/el6/en/x86_64/dag/RPMS/grsync-0.6.3-1.el6.rf.x86_64.rpm
rpm -Uvh grsync-0.63-1.el6.rf.x86_64.rpm
grsync
