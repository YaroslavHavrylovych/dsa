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
    echo $FILE_FULL_NAME
    if grep -q "public static void main" "$FILE_FULL_NAME"; then
        javac $FILE_FULL_NAME
    fi
done

echo "running..."
for FILE_FULL_NAME in *.java; do
    echo $FILE_FULL_NAME
    if grep -q "public static void main" "$FILE_FULL_NAME"; then
        FILENAME="${FILE_FULL_NAME%%.*}"
        java $FILENAME
    fi
done

echo "Java tests COMPLETED"
cd scripts
