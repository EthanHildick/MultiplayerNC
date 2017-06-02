
	nom=$1
	juador=$2
	juadorContrincant=$3
	linies=`cat casillas.txt | wc -l`
	liniesEscrites=`cat casillas.txt | wc -l`	
	echo "Espera a que moga fitxa..."
	while [[ $linies -eq $liniesEscrites ]]; do
		liniesEscrites=`cat casillas.txt | wc -l`
	done
	./server.sh $nom $juador $juadorContrincant
