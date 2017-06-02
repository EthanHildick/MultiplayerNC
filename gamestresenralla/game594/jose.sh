
	###FUNCTIONS###

	CASILLAS () {
		echo "   |   |   "" 		""   |   |   "
		echo " 0 | 1 | 2 "" ESCRIBE EL	"" ${array[0]} | ${array[1]} | ${array[2]} "
		echo "---|---|---"" NUMERO DE	""---|---|---"
		echo " 3 | 4 | 5 "" LA CASILLA	"" ${array[3]} | ${array[4]} | ${array[5]} "
		echo "---|---|---"" QUE QUIERES	""---|---|---"
		echo " 6 | 7 | 8 "" ESCOGER	"" ${array[6]} | ${array[7]} | ${array[8]} "
		echo "   |   |   "" 		""   |   |   "
		ESCRIBIR_EN_CASILLA
	}

	PONER_CASILLA () {
		casillaActual="${array[$numeroCasilla]}"
		echo "$casillaActual"
		if [ "$casillaActual" = " " ]
		then
			array[$numeroCasilla]=$juador
			echo "$juador $numeroCasilla" >> casillas.txt 
			COMPROBACIÓN_GANADOR
			echo "   |   |   "" 		""   |   |   "
		echo " 0 | 1 | 2 "" ESCRIBE EL	"" ${array[0]} | ${array[1]} | ${array[2]} "
		echo "---|---|---"" NUMERO DE	""---|---|---"
		echo " 3 | 4 | 5 "" LA CASILLA	"" ${array[3]} | ${array[4]} | ${array[5]} "
		echo "---|---|---"" QUE QUIERES	""---|---|---"
		echo " 6 | 7 | 8 "" ESCOGER	"" ${array[6]} | ${array[7]} | ${array[8]} "
		echo "   |   |   "" 		""   |   |   "
			./carga.sh $nom $juador $juadorContrincant
		else
			echo "Aquesta casilla ja està plena"		
		fi
		CASILLAS
	}

	ESCRIBIR_EN_CASILLA () {
		read numeroCasilla

			case $numeroCasilla in
				0)
					PONER_CASILLA
				;;
				1)
					PONER_CASILLA
				;;
				2)
					PONER_CASILLA
				;;
				3)
					PONER_CASILLA
				;;
				4)
					PONER_CASILLA
				;;
				5)
					PONER_CASILLA
				;;
				6)
					PONER_CASILLA
				;;
				7)
					PONER_CASILLA
				;;
				8)
					PONER_CASILLA
				;;
				*)
					echo "Entrada errónea"
					CASILLAS
				;;
			esac

	}
	COMPROBACION_CASILLAS () {

	comprobar=`cat casillas.txt | cut -d" " -f2`
	for numeros in $comprobar
	do
		personaje=`cat casillas.txt | grep $numeros | cut -d" " -f1`
		array[$numeros]=$personaje
	done

	}
	GUANYADOR () {
		echo "Has guanyat la partida!"
		echo "$juador" > guanyador.txt
		awk '$1==N{$3+=1}1' N=$nom ../../BaseDeDades.txt > ../../BaseDeDades.tmp
		mv ../../BaseDeDades.tmp ../../BaseDeDades.txt
		read asqwdqda
		cd ../..
		./Usuaris/$nom.sh $nom
	}

	PERDEDOR () {
		echo "Has perdut la partida"
		echo "$juadorContrincant" > guanyador.txt
		cd ../..
		./Usuaris/$nom.sh $nom
	}
	COMPROBACIÓN_GANADOR () {
	if [ $juador == "${array[0]}" ] && [ $juador == "${array[1]}" ] && [ $juador == "${array[2]}" ] ; then
      GUANYADOR
      elif [ $juador == "${array[3]}" ] && [ $juador == "${array[4]}" ] && [ $juador == "${array[5]}" ] ; then
      GUANYADOR
      elif [ $juador == "${array[6]}" ] && [ $juador == "${array[7]}" ] && [ $juador == "${array[8]}" ] ; then
      GUANYADOR
      elif [ $juador == "${array[0]}" ] && [ $juador == "${array[3]}" ] && [ $juador == "${array[6]}" ] ; then
      GUANYADOR;
      elif [ $juador == "${array[1]}" ] && [ $juador == "${array[4]}" ] && [ $juador == "${array[7]}" ] ; then
      GUANYADOR
      elif [ $juador == "${array[2]}" ] && [ $juador == "${array[5]}" ] && [ $juador == "${array[8]}" ] ; then
      GUANYADOR
      elif [ $juador == "${array[0]}" ] && [ $juador == "${array[4]}" ] && [ $juador == "${array[8]}" ] ; then
      GUANYADOR
      elif [ $juador == "${array[2]}" ] && [ $juador == "${array[4]}" ] && [ $juador == "${array[6]}" ] ; then
      GUANYADOR
	  elif [ $juadorContrincant == "${array[0]}" ] && [ $juadorContrincant == "${array[1]}" ] && [ $juadorContrincant == "${array[2]}" ] ; then
      PERDEDOR
      elif [ $juadorContrincant == "${array[3]}" ] && [ $juadorContrincant == "${array[4]}" ] && [ $juadorContrincant == "${array[5]}" ] ; then
      PERDEDOR
      elif [ $juadorContrincant == "${array[6]}" ] && [ $juadorContrincant == "${array[7]}" ] && [ $juadorContrincant == "${array[8]}" ] ; then
      PERDEDOR
      elif [ $juadorContrincant == "${array[0]}" ] && [ $juadorContrincant == "${array[3]}" ] && [ $juadorContrincant == "${array[6]}" ] ; then
      PERDEDOR;
      elif [ $juadorContrincant == "${array[1]}" ] && [ $juadorContrincant == "${array[4]}" ] && [ $juadorContrincant == "${array[7]}" ] ; then
      PERDEDOR
      elif [ $juadorContrincant == "${array[2]}" ] && [ $juadorContrincant == "${array[5]}" ] && [ $juadorContrincant == "${array[8]}" ] ; then
      PERDEDOR
      elif [ $juadorContrincant == "${array[0]}" ] && [ $juadorContrincant == "${array[4]}" ] && [ $juadorContrincant == "${array[8]}" ] ; then
      PERDEDOR
      elif [ $juadorContrincant == "${array[2]}" ] && [ $juadorContrincant == "${array[4]}" ] && [ $juadorContrincant == "${array[6]}" ] ; then
      PERDEDOR
      fi
}
	###MAIN PROGRAM###
	nom=$1
	juador=$2
	juadorContrincant=$3
	array=( " " " " " " " " " " " " " " " " " " )
	COMPROBACION_CASILLAS
	linies=`cat casillas.txt | wc -l`
	if [ $linies -eq 9 ]
	then
		echo "Heu empatat :/"
		cd ../..
		./Usuaris/$nom.sh $nom
	fi
	echo "${array[*]}"
	CASILLAS

    
