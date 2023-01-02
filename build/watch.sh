#!/bin/bash
FILE=$1
if [ -z "$FILE" ]; then
  echo "target file is required."
  exit 1
fi

md5sum $FILE > .checksum
while true
do
  sleep 5
  md5sum --quiet -c .checksum || \
  echo "file updated" && \
  ./build/gen-pdf.sh $FILE && \
  ./build/gen-html.sh $FILE && \
  md5sum $FILE > .checksum
done  
