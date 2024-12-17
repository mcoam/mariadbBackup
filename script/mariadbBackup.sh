#!/bin/bash

date=$(date '+%d%m%Y')
folder="/BACKUP"
log="/var/log/mariabackup.log"
lastFull="$folder/.last"
userdb=dbadmin
userpass=P@ssword

if [ $(date +%w) = 2 ]; then #dia domingo
	echo "Creando full backup nextcloud DB"
	mkdir $folder/full-$date
	mariabackup --backup --target-dir=$folder/full-$date --user=$userdb --password=$userpass
	echo $date > $lastFull

  else
	fullName=`cat $lastFull`
	num=$(date '+%w')
	   echo "Creando incremental nextcloud DB"
	   mariabackup --backup --target-dir=$folder/full-$fullName/inc$num/ --incremental-basedir=$folder/full-$fullName --user=$userdb --password=$userpass
	   exit 0
  fi
