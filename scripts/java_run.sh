#!/bin/bash

echo "Java tests"
if ! [[ $(pwd) == *"scripts" ]]; then
    #if we build from the parent directory (the common case)
    cd scripts
fi
./clean.sh
cd ..


KEY=$1
if [[ ! $KEY ]]; then
    KEY="java"
else
    KEY="*$KEY*"
    echo "The file template: $KEY"
fi

mkdir -p out/java
cd out/java
find ../../algorithms/ -type d -iname "${KEY}" | grep "java" \
    | while read FILES_PATH; do

    #creating a build dir
    #the last (-1) folder is "java", and (-2) - an algorithm's name
    IFS='/' read -ra ADDR <<< "$FILES_PATH"
    FOLDER_NAME="${ADDR[${#ADDR[*]}-2]}"
    mkdir "$FOLDER_NAME"
    cp $FILES_PATH/*.java "$FOLDER_NAME"
    cd $FOLDER_NAME

    echo "building $FOLDER_NAME"
    javac *.java
    echo "done"

    echo "running $FOLDER_NAME"
    java Test
    echo "done"

    cd ..
done
cd ../../scripts

echo "Java tests COMPLETED"
