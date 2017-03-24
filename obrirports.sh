#!/bin/bash
contator=`cat contador.txt`

Infinit=0

while [ $Infinit -eq 0 ]
do

rm -f arx$contator
mkfifo arx$contator

nc -l $contator < arx$contator | ./pedrapapertisores2.sh > arx$contator

rm -f arx$contator
done
