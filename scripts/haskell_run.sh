#!/bin/bash

echo "Haskell tests"
if ! [[ $(pwd) == *"scripts" ]]; then
    #if we build from the parent directory (the common case)
    cd scripts
fi
./clean.sh
cd ..

key=$1
if [[ ! $key ]]; then
    key="haskell"
else
    key="$key"
    echo "The file template: $key"
fi

mkdir -p out/haskell
cd out/haskell
find  ../../algorithms/ -type d -iname "haskell" | grep "${key}" \
    | while read FILES_PATH; do

    #creating a build dir
    #the last (-1) folder is "haskell", and (-2) - an algorithm's name
    IFS='/' read -ra ADDR <<< "$FILES_PATH"
    FOLDER_NAME="${ADDR[${#ADDR[*]}-2]}"
    mkdir "$FOLDER_NAME"
    cp $FILES_PATH/*.hs "$FOLDER_NAME"
    cd $FOLDER_NAME

    echo "building $FOLDER_NAME"
    ghc -o Test Test.hs     
    echo "done"

    echo "running $FOLDER_NAME"
    ./Test
    echo "done"

    cd ..
done
cd ../../scripts

echo "Haskell tests COMPLETED"
