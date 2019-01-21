#!/bin/bash

echo "Kotlin tests"
cd scripts/
./clean.sh
echo "copying files..."
cd ..
mkdir -p out/kotlin
find algorithms/ -name *.kt -exec cp {} out/kotlin \;

key=$1
if [[ ! $key ]]; then
    key="*"
else
    key="*$key*"
fi
echo "The file template: $key"

echo "building..."
cd out/kotlin
for FILE_FULL_NAME in *.kt; do
    if [[ $FILE_FULL_NAME == *$key* ]]; then
        FILENAME="${FILE_FULL_NAME%%.*}"
        kotlinc $FILE_FULL_NAME -include-runtime -d $FILENAME.jar -jvm-target 1.8
    fi
done

echo "running..."
for FILE_FULL_NAME in *.jar; do
    if [[ $FILE_FULL_NAME == *$key* ]]; then
        java -jar $FILE_FULL_NAME
    fi
done
cd ../../scripts

echo "Kotlin tests COMPLETED"
