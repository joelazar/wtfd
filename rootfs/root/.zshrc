#!/usr/bin/env zsh

alias c="clear"
alias db-connect="psql postgresql://$DB_USER@$DB_HOST:$DB_PORT/$DB_NAME"

function db-dump() {
  filename="dump-$DB_HOST-$DB_NAME-`date +"%Y%m%d-%H%M"`.sql"
  if pg_dump --host=$DB_HOST --username=$DB_USER --dbname=$DB_NAME -f $filename; then
    gzip $filename
  fi
}
