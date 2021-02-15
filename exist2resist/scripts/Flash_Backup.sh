#!/bin/bash
SOURCE="/boot/config/*"
DESTINATION="/mnt/disks/DataDisk/backups/flash/"
FILENAME="FLASH_`date +%F`.tar"
DAYS=31

nice tar -zcf $DESTINATION$FILENAME $SOURCE

cd $DESTINATION

nice find . -mtime +$DAYS -exec rm {} \;
