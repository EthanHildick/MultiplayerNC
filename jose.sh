
#!/bin/bash 

CONTADOR=33000
MAX=33005


while [ $CONTADOR -lt $MAX ]; do
	let CONTADOR=CONTADOR+1  
	echo "$CONTADOR" > contador.txt

	gnome-terminal -e "bash -c ./obrirports.sh;bash"
	
done

	echo Hi han $CONTADOR jugadors

tamare=0

while [ $tamare -eq 0 ]; do
	contadorports=`netstat -nt | grep  :330 | wc -l`

	let contadorports=$contadorports+33001

	echo  "$contadorports" > ElsPorts.txt 

	cat ElsPorts.txt | nc -l 33026 
done