
nom=$1
	numeroDeNumeros="0"
	while [ $numeroDeNumeros -le 15 ]
	do

		array=$(($RANDOM%99))
		binguete=`echo "${numerosBingo[*]}"`
		numerosBingo[$numeroDeNumeros]="$array"
		let numeroDeNumeros=$numeroDeNumeros+1
	done
	contador=1
echo "Juegas con estos numeros: $binguete"
intents=0
laMareDeJosep=0
	while [ $laMareDeJosep -eq 0 ]
		do

		resultatBingo=`cat resultatBingo.txt | cut -d" " -f$contador`
		let contador=$contador+1
		elBingo=`echo "${numerosBingo[*]}"`
		numeroDeNumeros="0"

		for aquestNumero in $elBingo
		do
			if [ $aquestNumero -eq $resultatBingo ]
			then
				numerosBingo[$numeroDeNumeros]="0"
			fi
			let numeroDeNumeros=$numeroDeNumeros+1
		done

		echo "${numerosBingo[*]}"
		contadorDeZeros=0
		numeroDeNumeros="0"

		for zeros in $elBingo
		do
			let contadorDeZeros=$contadorDeZeros+$zeros
		done

		if [ $contadorDeZeros -eq 0 ]
		then
			echo "Has acabat amb $intents intents!"
			echo "$nom $intents" >> resultatsGlobals.txt
			laMareDeJosep=1
			./carga.sh $nom
			break
			
		else
			let intents=$intents+1
			echo "Portes $intents intents. Pulsa enter per a continuar: "
			read dsfjhdasdasfdsff
		fi

	done
