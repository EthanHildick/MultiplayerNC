nom=$1
aleatorio=$2
	#1 pedra
	#2 paper
	#3 tisores

	#1 < 2
	#2 < 3
	#3 < 1

	jugador1=`cat eleccio.txt | grep ^$nom | cut -d' ' -f2`
	jugador2=`cat eleccio.txt | grep -v ^$nom | cut -d' ' -f2`

	if [[ $jugador1 = 1 ]]; then
			if [[ $jugador2 = $jugador1 ]]; then
				echo 'Empate'
				resultat=0
			fi
			if [[ $jugador2 =  2 ]]; then
				echo 'Has perdut!'
				resultat=0
			fi
			if [[ $jugador2 =  3 ]]; then
				echo 'Has guanyat!'
				resultat=1
			fi
	fi

	if [[ $jugador1 = 2 ]]; then
			if [[ $jugador2 = $jugador1 ]]; then
				echo 'Empate'
				resultat=0
			fi
			if [[ $jugador2 =  1 ]]; then
				echo 'Has guanyat!'
				resultat=1
			fi
			if [[ $jugador2 =  3 ]]; then
				echo 'Has perdut!'
				resultat=0
			fi
	fi

	if [[ $jugador1 = 3 ]]; then
			if [[ $jugador2 = $jugador1 ]]; then
				echo 'Empate'
				resultat=0
			fi
			if [[ $jugador2 =  2 ]]; then
				echo 'Has guanyat!'
				resultat=1
			fi
			if [[ $jugador2 =  1 ]]; then
				echo 'Has perdut!'
				resultat=0
			fi
	fi
echo
awk '$1==N{$3+=R}1' N=$nom R=$resultat ../../BaseDeDades.txt > ../../BaseDeDades.tmp
	mv ../../BaseDeDades.tmp ../../BaseDeDades.txt

echo 'Altra?[S/n]'
	jugar=0
	while [ $jugar -eq 0 ]
	do
		read altra
		case $altra in
			S)
			jugaraltra=1
			jugar=1
			;;
			s)
			jugaraltra=1
			jugar=1                                   
			;;
			n)
			jugaraltra=0
			jugar=1
			;;
			N)
			jugaraltra=0
			jugar=1
			;;
			*)
			echo 'Elecció errónea'
			;;
		esac
	done
echo $nom $jugaraltra >> eleccions.txt
	./cargapedrapapertisoreseleccions.sh $nom $aleatorio

