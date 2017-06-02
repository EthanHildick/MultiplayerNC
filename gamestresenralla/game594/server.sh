
	nom=$1
	juador=$2
	juadorContrincant=$3
	COMPROBACIÓN_CASILLAS () {

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
		cd ../..
		./Usuaris/$nom.sh $nom
	}

	PERDEDOR () {
		echo "Has perdut la partida"
		echo "$juadorContrincant" > guanyador.txt
		read aeada
		cd ../..
		./Usuaris/$nom.sh $nom
	}
	array=( " " " " " " " " " " " " " " " " " " )
	COMPROBACIÓN_CASILLAS
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

	  ./$nom.sh $nom $juador $juadorContrincant
