# mariadb-backup-script

Full backup
------------

1. make a full backup on Sat (day 6 of week) and incremental from Sun to Fri

```
# sh mariadbBackup.sh
```

The full backup is:

```
# /BACKUP/16122024
```

and the incremental are:

```
# /BACKUP/16122024/inc{0,1,2,3,4,5}
```

2. For recovery command (ensure MariaDB datadir is empty)

```
# mariadb-backup  --prepare --target-dir=/BACKUP/16122024/ --incremental-dir=/BACKUP/16122024/inc5/
# mariadb-backup  --copy-back  --target-dir=/BACKUP/16122024/ --incremental-dir=/BACKUP/16122024/inc5/
# chown -R mysql:mysql /var/lib/mysql/
```