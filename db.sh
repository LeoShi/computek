#!/bin/bash

USER_NAME="root"
PASSWORD="kukid123#"
HOST="localhost"
BACKUP_PATH="/tmp/shenma_db_backup"

MYSQL="$(which mysql)"
MYSQLDUMP="$(which mysqldump)"
GZIP="$(which gzip)"
GUNZIP="$(which gunzip)"

function log {
  echo "****** $1"
  echo ""
}

function backup_db {
 rm -rf $BACKUP_PATH 
 mkdir -p $BACKUP_PATH
 
 log "Start to backup '$1' db."
 FILE="$BACKUP_PATH/$1_backup.gz"
 set_hostname $2
 $MYSQLDUMP -h $HOST -u $USER_NAME -p$PASSWORD $1 | $GZIP -9 > $FILE
 log "finished to backup db in $FILE"
}

function restore_db {
  FILE="$BACKUP_PATH/$1_backup.gz"
  set_hostname $2
  log "Will restore db from '$FILE'"	
  $GUNZIP < $FILE | $MYSQL -h $HOST -u $USER_NAME -p$PASSWORD $1
  log "finished to restore db."
}

function set_hostname {
  if [ -n "$1" ]; then
    HOST=$1
  fi
}

if [ -n "$1" ]; then
  eval $1
fi
