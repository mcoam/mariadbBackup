date=$(date '+%d%m%Y')
dateLog=$(date '+%d-%m-%Y %H:%M:%S')
folder="/BACKUP"
log="/var/log/mariabackup.log"
lastFull="$folder/.last"
userdb=dbadmin
userpass=P@ssword

if [ $(date +%w) = 6 ]; then #dia sab
        echo "$dateLog Creando full backup full-$date DB" >> $log
        mkdir $folder/full-$date
        mariabackup --backup --target-dir=$folder/full-$date --user=$userdb --password=$userpass
        echo $date > $lastFull
        echo "$dateLog Terminando full backup full-$date DB" >> $log

  else
        fullName=`cat $lastFull`
        num=$(date '+%w')
           echo "$dateLog Creando incremental backup full-$fullName/inc$num DB" >> $log
             mariabackup --backup --target-dir=$folder/full-$fullName/inc$num/ --incremental-basedir=$folder/full-$fullName --user=$userdb --password=$userpass
           echo "$dateLog Terminando incremental backup full-$fullName/inc$num DB" >> $log
           exit 0
  fi
