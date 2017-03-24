#!/bin/bash
nom=$1
	source functions.txt
	
	echo "---MENU---
	1- Contra ordinador
	2- Crear partida
	3- Buscar partida
	4- Eixir al menú principal
	5- Eixir del joc"
	read a
eixirpaper=0
while [ $eixirpaper -eq 0 ]
do
	case $a in
		1)
			eixirpaper=1
			./PartidaIA.sh $nom
		;;

		2)
			aleatorio=`echo $((1+$RANDOM%1000))`
			echo "Nº de partida: $aleatorio"
			mkdir game$aleatorio
			cd game$aleatorio
			touch $nom.sh server.sh carga.sh
			chmod 777 *.sh
			jugador > $nom.sh
			server > server.sh
			carga > carga.sh
			eixirpaper=1
			./$nom.sh $nom
		;;

		3)
			echo -n "Introdueix el Nº de partida: "
			read key
			cd game$key
			touch $nom.sh
			chmod 777 *.sh
			jugador > $nom.sh
			eixirpaper=1
			./$nom.sh $nom
		;;
		4)
		./Usuaris/$nom.sh $nom
		eixirpaper=1
		;;
		5)
		eixirpaper=1
		exit
		;;
		*)
		echo "Comandament Erroni"
		;;
	esac
done
