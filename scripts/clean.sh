#!/bin/bash

cd ..
OUT_NAME="out"
if [ -d "$OUT_NAME" ]; then
    rm -r $OUT_NAME
fi
cd scripts
