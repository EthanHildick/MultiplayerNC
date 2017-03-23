
nom=$1
	#1 pedra
	#2 paper
	#3 tisores

	#1 < 2
	#2 < 3
	#3 < 1

	jugador1=`cat eleccio.txt | grep ^$nom | cut -d" " -f2`
	jugador2=`cat eleccio.txt | grep -v ^$nom | cut -d" " -f2`

	if [[ $jugador1 = 1 ]]; then
			if [[ $jugador2 = $jugador1 ]]; then
				echo "Empate"
			fi
			if [[ $jugador2 =  2 ]]; then
				echo "Has perdut!"
			fi
			if [[ $jugador2 =  3 ]]; then
				echo "Has guanyat!"
			fi
	fi

	if [[ $jugador1 = 2 ]]; then
			if [[ $jugador2 = $jugador1 ]]; then
				echo "Empate"
			fi
			if [[ $jugador2 =  1 ]]; then
				echo "Has guanyat!"
			fi
			if [[ $jugador2 =  3 ]]; then
				echo "Has perdut!"
			fi
	fi

	if [[ $jugador1 = 3 ]]; then
			if [[ $jugador2 = $jugador1 ]]; then
				echo "Empate"
			fi
			if [[ $jugador2 =  2 ]]; then
				echo "Has guanyat!"
			fi
			if [[ $jugador2 =  1 ]]; then
				echo "Has perdut!"
			fi
	fi
