SOURCE=/boot/*

DESTINATION=/mnt/disks/DataDisk/backups/flash/

DAYS=14

tar -cf $SOURCE $DESTINATION

cd $DESTINATION

nice find . -mtime +$DAYS rm {} \;  
