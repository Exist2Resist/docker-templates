#!/bin/bash
#
# MySQL/MariaDB docker backup script
# Execute from host computer
# Exist2Resist
#
# Example:
# docker exec -it MariaDB sh -c "mysqldump -u root -p'somepassword' --all-databases > /var/lib/mysql/sqlbackup/backupfilename.sql"
#
# In Unraid use user scripts to schedule this script otherwise
# use cron to schedule this script to run as frequently as you want.
#
###################################################################################
 
 #Docker container name, case sensitive
 CONTAINER="MariaDB"
 
 #Username
 USERNAME="root"
 
 #Password
 PASSWORD="somepassword"
 
 #Database name use --all-databases to backup the entire server
 DATABASE="--all-databases"
 
 #Backup destination folder in SQL container, prefereably one that is shared and accessible 
 #to the host computer as not lose data during container updates.
 DESTINATION="/var/lib/mysql/sqlbackup/"
 
 #SQL bakup date and name
 BACKUPNAME="KODI_`date +%F_%H-%M-%S`.sql"
 
 #SQL dump command
 SQL_DUMP_COMMAND="mysqldump -u $USERNAME  -p'$PASSWORD' $DATABASE > $DESTINATION$BACKUPNAME"
 
 #Remove the '-it' switch from the below otherwise you will get an ERROR “The input device is not a TTY”.
 #docker exec -it $CONTAINER sh -c "$SQL_DUMP_COMMAND"
 docker exec $CONTAINER sh -c "$SQL_DUMP_COMMAND"
 
 #Variables, SRC is source of sql dumps, DEST is where they will be copied to, DAYS is how long the backups will be kept for.
 SRC="/mnt/disks/DataDisk/data/MariaDB/sqlbackup/*.sql"
 DEST="/mnt/disks/DataDisk/backups/mariadb/"
 DAYS=14
 
 #Move SQL dumps
 mv $SRC $DEST

 #Change directory
 cd $DEST
 
 #Command to delte old backups.
 nice find . -mtime +$DAYS -exec rm {} \;
