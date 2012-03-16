#!/bin/bash

for f in $(ls test/good)
do
    echo ""
    f=test/good/$f
    echo "Testing $f... "
    ./fsafe $f
done;

for f in $(ls test/bad)
do
    echo ""
    f=test/bad/$f
    echo "Testing $f... "
    ./fsafe $f
done;
case  in
    