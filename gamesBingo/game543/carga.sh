
	nom=$1
	echo "Espera a que acaben els demés..."
	echo
	linies=`cat resultatsGlobals.txt | wc -l`		

	while [[ $linies -lt 4 ]]; do
		linies=`cat resultatsGlobals.txt | wc -l`
	done

	if [[ $linies -eq 4 ]]; then
		./server.sh $nom
	fi
