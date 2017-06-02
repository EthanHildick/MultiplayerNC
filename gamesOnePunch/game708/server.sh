
	#FUNCTIONS#
	COMPROBACION_PERSONAJE () {
		x=`cat posicion$juador.txt | cut -d" " -f1`
		y=`cat posicion$juador.txt | cut -d" " -f2`
		X=`cat posicion$juadorContrincant.txt | cut -d" " -f1`
		Y=`cat posicion$juadorContrincant.txt | cut -d" " -f2`
		eval posicion$juadorContrincant[0]=$X
		eval posicion$juadorContrincant[1]=$Y
		posicion=( "$x" "$y" )
	}
	#MAIN PROGRAM#
	nom=$1
	juador=$2
	juadorContrincant=$3
	COMPROBACION_PERSONAJE
	tuX=`echo "${posicion[0]}"`
	ellX=$X
	tuY=`echo "${posicion[1]}"`
	ellY=$Y
	if [ $tuX -eq $ellX ] && [ $tuY -eq $ellY ] 
	then
		echo "Has perdut!"
		read safasfasfasdf
		cd ../..
		./Usuaris/$nom.sh $nom
	fi 


	./$nom.sh $nom $juador $juadorContrincant
