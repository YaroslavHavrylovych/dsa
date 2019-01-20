#!/bin/bash

echo "Kotlin tests"
cd scripts/
./clean.sh
echo "copying files..."
cd ..
mkdir -p out/kotlin
find algorithms/ -name *.kt -exec cp {} out/kotlin \;


echo "building..."
cd out/kotlin
for FILE_FULL_NAME in *.kt; do
    FILENAME="${FILE_FULL_NAME%%.*}"
    kotlinc $FILE_FULL_NAME -include-runtime -d $FILENAME.jar -jvm-target 1.8
done

echo "running..."
for FILE_FULL_NAME in *.jar; do
    java -jar $FILE_FULL_NAME
done
cd ../../scripts

echo "Kotlin tests COMPLETED"
