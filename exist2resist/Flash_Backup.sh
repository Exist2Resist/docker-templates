#!/bin/bash
SOURCE="/boot/*"
DESTINATION="/mnt/disks/DataDisk/backups/flash/"
FILENAME="FLASH_`date +%F_%H-%M-%S`.tar"
DAYS=14

tar -cf $SOURCE $DESTINATION$FILENAME

cd $DESTINATION

nice find . -mtime +$DAYS -exec rm {} \;
