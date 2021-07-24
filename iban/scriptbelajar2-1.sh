#!/bin/bash
# Basic while loop
counter=1
while [ $counter -le 10 ]
do
echo “Angka : $counter”
((counter++))
done
echo All done
