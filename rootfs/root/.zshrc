#!/usr/bin/env zsh

alias c="clear"
alias db-connect="psql postgresql://$DB_USER@$DB_HOST:$DB_PORT/$DB_NAME"

function db-dump() {
  filename-"dump-$DB_HOST-$DB_NAME-`date +"%Y%m%d-%H%M"`"
  pg_dumpall -U $DB_USER -h $DB_HOST -p $DB_PORT -l $DB_NAME --quote-all-identifiers | gzip > $filename.sql.gz
}
