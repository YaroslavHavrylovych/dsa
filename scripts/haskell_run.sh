#!/bin/bash

echo "Haskell tests"
cd scripts/
./clean.sh
echo "copying files..."
cd ..
mkdir -p out/haskell
find algorithms/ -name *.hs -exec cp {} out/haskell \;

key=$1
if [[ ! $key ]]; then
    key="*"
else
    key="*$key*"
fi
echo "The file template: $key"

echo "building..."
cd out/haskell
for FILE_FULL_NAME in *.hs; do
    if [[ $FILE_FULL_NAME == $key ]]; then
        FILENAME="${FILE_FULL_NAME%%.*}"
        ghc -o $FILENAME $FILE_FULL_NAME
    fi
done

echo "running..."
for FILE_FULL_NAME in *.hs; do
    if [[ $FILE_FULL_NAME == $key ]]; then
        FILENAME="${FILE_FULL_NAME%%.*}"
        ./$FILENAME
    fi
done
cd ../../scripts

echo "Haskell tests COMPLETED"
