###FUNCTIONS###

CASILLAS () {
	echo "-------"" ESCRIBE	""-------"
	echo "|0|1|2|"" EL NUM.	""|${array[0]}|${array[1]}|${array[2]}|"
	echo "-------"" DE LA 	""-------"
	echo "|3|4|5|"" CASILLA	""|${array[3]}|${array[4]}|${array[5]}|"
	echo "-------"" QUE	""-------"
	echo "|6|7|8|"" QUIERES	""|${array[6]}|${array[7]}|${array[8]}|"
	echo "-------"" ESCOGER	""-------"

}

ESCRIBIR_EN_CASILLA () {
	read numeroCasilla
	case $numeroCasilla in
		0)
			casillaActual="${array[0]}"
			if [ $casillaActual = " " ]
			then
			#estava per ací	
else
			
fi
		;;
		1)
			casillaActual="${array[1]}"
		;;
		2)
			casillaActual="${array[2]}"
		;;
		3)
			casillaActual="${array[3]}"
		;;
		4)
			casillaActual="${array[4]}"
		;;
		5)
			casillaActual="${array[5]}"
		;;
		6)
			casillaActual="${array[6]}"
		;;
		7)
			casillaActual="${array[7]}"
		;;
		8)
			casillaActual="${array[8]}"
		;;
		*)
		;;
	esac
}

###MAIN PROGRAM###
array=( " " " " " " " " " " " " " " " " " " )
echo "${array[*]}"
CASILLAS


