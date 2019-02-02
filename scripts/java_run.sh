#!/bin/bash

echo "Java tests"
cd scripts/
./clean.sh
echo "copying files..."
cd ..
mkdir -p out/java
find algorithms/ -name *.java -exec cp {} out/java \;

key=$1
if [[ ! $key ]]; then
    key="*"
else
    key="*$key*"
fi
echo "The file template: $key"

echo "building..."
cd out/java
for FILE_FULL_NAME in *.java; do
    if [[ $FILE_FULL_NAME == $key ]]; then
        javac $FILE_FULL_NAME
    fi
done

echo "running..."
for FILE_FULL_NAME in *.java; do
    if grep -q "public static void main" "$FILE_FULL_NAME"; then
        if [[ $FILE_FULL_NAME == $key ]]; then
            FILENAME="${FILE_FULL_NAME%%.*}"
            java $FILENAME
        fi
    fi
done
cd ../../scripts

echo "Java tests COMPLETED"
