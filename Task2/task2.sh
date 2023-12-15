#!/bin/bash
DB_NAME="moodle_database"
DUMP_FILE="moodle_$(date +'%Y_%m_%d|%H:%M:%S').sql"
CONFIG_FILE="config.cnf"
mysqldump --defaults-extra-file="$CONFIG_FILE" "$DB_NAME" > "$DUMP_FILE"
if [ $? -eq 0 ]; then
    echo "\e[0;32mSUCCESSFUL\e[0mDatabase dump successful. File saved as: $DUMP_FILE"
else
    echo "\e[0;31mError:\e[0m Database dump failed."
fi
