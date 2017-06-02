
	nom=$1
	juador=$2
	juadorContrincant=$3
	linies=`cat casillas.txt | wc -l`
	liniesEscrites=`cat casillas.txt | wc -l`	
	if [ $linies -eq 9 ]
	then
		echo "Heu empatat :/"
		cd ../..
		./Usuaris/$nom.sh $nom
	fi
	echo "Espera a que moga fitxa..."
	while [[ $linies -eq $liniesEscrites ]]; do
		liniesEscrites=`cat casillas.txt | wc -l`
	done
	./server.sh $nom $juador $juadorContrincant
