#!/usr/bin/env bash
# Son başarılı full backup tarihini kontrol eder.
# Kullanım: ./backup-check.sh <server> <database>
set -euo pipefail

SERVER="${1:?server gerekli}"
DB="${2:?database gerekli}"

sqlcmd -S "$SERVER" -d msdb -Q \
  "SELECT database_name, MAX(backup_finish_date) AS last_backup
   FROM backupset
   WHERE database_name = '$DB' AND type = 'D'
   GROUP BY database_name;"
