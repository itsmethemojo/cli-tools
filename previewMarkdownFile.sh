#!/bin/bash

FILE=README.md

if [ ! -z "$1" ]
  then
    FILE=$1
fi

if [ "$(ls -1 "$FILE" 2>/dev/null)" != "$FILE" ]
  then
    echo "file $FILE does not exist"
    exit 1
fi
# TODO make runner customizable
google-chrome $(pwd)/$FILE &
