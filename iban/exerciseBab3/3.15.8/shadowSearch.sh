#!/bin/bash

#scipt mencari keyword "shadow"
scannedfile=`cat /etc/group | grep shadow`

counter=0

for value  in $scannedfile
do

((counter++))

done

if [ $counter -gt 10 ]; then
echo "Lebih dari 10"
else
echo "Kurang dari 10"
fi

