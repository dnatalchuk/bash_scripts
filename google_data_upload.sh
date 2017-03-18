#!/usr/bin/env bash
# Script using description:
# data in file passed as parameter - will be loaded to MySql under database: discrepancy_check, table: google
# - put file in dir with script and run from local PC: ./google_upload.sh "FILE"


# MySQL creadentials: might be adjusted
MYSQL_USER="strkd_dscr"
MYSQL_PASS="inV!n0v3r1t@s"
MYSQL_HOST="manager.de.eu.support.strikead.com"

# Script variables definition
ssp_name='google'
inputfile=$1
up_file=/tmp/up_file
up_file1=/tmp/up_file1


# Data formatting for upload
echo "$(tail -n +2 $inputfile)" > $inputfile
awk -F'"' -v OFS='' '{ for (i=2; i<=NF; i+=2) gsub(",", "", $i) } 2' $inputfile > $up_file
sed 's/\"//g' $up_file  > $up_file1


# Data upload itself

IFS=,
while read column1 column2 column3
      do
      echo "INSERT INTO google (date,ssp,impressions,spent) VALUES ('$column1', '$ssp_name', '$column2', '$column3');"

done < $up_file1 | mysql -u${MYSQL_USER} -h${MYSQL_HOST} -p${MYSQL_PASS} discrepancy_check;

echo -e "\nSTATUS: DATA UPLOAD COMPLETED"

# Removing earlier created files
rm $up_file
rm $up_file1