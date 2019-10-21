#!/bin/bash

echo "Kotlin tests"
if ! [[ $(pwd) == *"scripts" ]]; then
    #if we build from the parent directory (the common case)
    cd scripts
fi
./clean.sh
cd ..

key=$1
if [[ ! $key ]]; then
    key="kotlin"
else
    key="$key"
echo "The file template: $key"
fi

mkdir -p out/kotlin
cd out/kotlin
find  ../../algorithms/ -type d -iname "kotlin" | grep "$key" \
    | while read FILES_PATH; do

    #creating a build dir
    #the last (-1) folder is "kotlin", and (-2) - an algorithm's name
    IFS='/' read -ra ADDR <<< "$FILES_PATH"
    FOLDER_NAME="${ADDR[${#ADDR[*]}-2]}"
    mkdir "$FOLDER_NAME"
    cp $FILES_PATH/*.kt "$FOLDER_NAME"
    cd $FOLDER_NAME

    echo "building $FOLDER_NAME"
    kotlinc -include-runtime  -d Test.jar -jvm-target 1.8 *.kt
    echo "done"

    echo "running $FOLDER_NAME"
    java -jar Test.jar
    echo "done"

    cd ..
done
cd ../../scripts

echo "Kotlin tests COMPLETED"
