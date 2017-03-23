
nom=$1
	echo "1-Pedra
	2-Paper
	3-Tisores"

	read eleccio
		case $eleccio in 
		
			1)
				jugador=1
			;;
			2)
				jugador=2
			;;
			3)
				jugador=3
		esac
	echo "$nom $jugador" >> eleccio.txt
	./carga.sh $nom
