#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: ./generate-database.sh <pv_db_dir> <destination>"
  exit 1
fi

source=$1
destination=$2

rm $destination

for file in "$source"/*; do
    # Check if the item is a file
    if [[ -f "$file" ]]; then
        sort -t '=' -k1,1 $file >> $destination
        printf '\n' >> $destination
    fi
done
