#!/bin/bash

MONGO_HOST="provide_local_host"
MONGO_PORT="port_number"

APP_NAME="name_of_application"
TIMESTAMP=`date +%d_%m_%y_%H_%M_%S`
BACKUP_NAME="$APP_NAME-$TIMESTAMP"
OUT_PATH="directory_to_get_the_backup"

mongo admin --eval "printjson(db.fsyncLock())"
mongodump -d <db_name> -o $OUT_PATH
mongo admin --eval "printjson(db.fsyncUnlock())"

cd $OUT_PATH
mv <db_name> $BACKUP_NAME
tar -zcvf $BACKUP_NAME.tgz $BACKUP_NAME
rm -rf $BACKUP_NAME

find ./ -type f -mtime +7 -delete

