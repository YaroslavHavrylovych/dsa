#!/bin/bash

echo "Java tests"
cd scripts/
./clean.sh
echo "copying files..."
cd ..
mkdir -p out/java
find algorithms/ -name *.java -exec cp {} out/java \;


echo "building..."
cd out/java
for FILE_FULL_NAME in *.java; do
    javac $FILE_FULL_NAME
done

echo "running..."
for FILE_FULL_NAME in *.java; do
    if grep -q "public static void main" "$FILE_FULL_NAME"; then
        FILENAME="${FILE_FULL_NAME%%.*}"
        java $FILENAME
    fi
done
cd ../../scripts

echo "Java tests COMPLETED"
