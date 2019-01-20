#!/bin/bash

echo "Haskell tests"
cd scripts/
./clean.sh
echo "copying files..."
cd ..
mkdir -p out/haskell
find algorithms/ -name *.hs -exec cp {} out/haskell \;


echo "building..."
cd out/haskell
for FILE_FULL_NAME in *.hs; do
    FILENAME="${FILE_FULL_NAME%%.*}"
    ghc -o $FILENAME $FILE_FULL_NAME
done

echo "running..."
for FILE_FULL_NAME in *.hs; do
    FILENAME="${FILE_FULL_NAME%%.*}"
    ./$FILENAME
done
cd ../../scripts

echo "Haskell tests COMPLETED"
