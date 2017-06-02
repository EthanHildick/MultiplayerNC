
nom=$1
aleatorio=$2
	echo "
	1-Pedra
	2-Paper
	3-Tisores
	4-Eixir"
	asdf=0
		while [ $asdf -eq 0 ]
		do
		read eleccio
			case $eleccio in 
		
				1)
					jugador=1
					asdf=1 
				;;
				2)
					jugador=2
					asdf=1 
				;;
				3)
					jugador=3
					asdf=1
				;; 
				4)
					cd ../..
					./pedrapapertisores.sh $nom	
				;;
				*)
					echo "Elecció errónea, torna-ho a intentar"
				;;
			esac
		done
	echo "$nom $jugador" >> eleccio.txt
	./carga.sh $nom $aleatorio
