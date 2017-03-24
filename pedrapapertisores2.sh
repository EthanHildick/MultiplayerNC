#!/bin/bash
source functions.txt
echo "Conectat"
eixir=0
while [ $eixir -eq 0 ]
do
echo "Ja tens un compte d'usuari? [S/n]"
read a
case $a in
	S)
		echo "Introdueix nom d'usuari: "
		read I
		echo "Contrasenya: "
		read C

		#comprovar si la contrasenya es correcta
		psswd=`grep ^$I BaseDeDades.txt | cut -d" " -f2`
		if [[ "$psswd" = "$C" ]]; then
				#statements
				echo "Conectat"
				eixir=1
				./Usuaris/$I.sh $I
			else
				echo "Contrasenya incorrecta"
		fi
	;;
	s)
		echo "Introdueix nom d'usuari: "
		read I
		echo "Contrasenya: "
		read C

		#comprovar si la contrasenya es correcta
		psswd=`grep ^$I BaseDeDades.txt | cut -d" " -f2`
		if [[ "$psswd" = "$C" ]]; then
				#statements
				echo "Conectat"
				eixir=1
				./Usuaris/$I.sh $I
			else
				echo "Contrasenya incorrecta"
		fi
	;;
	
	n)
		echo "Crea nom d'usuari: "
		read n

		echo "Contrasenya: "
		read p

		echo "$n $p" >> BaseDeDades.txt
		touch Usuaris/$n.sh
		chmod 777 Usuaris/*.sh
		usuari > Usuaris/$n.sh
		eixir=1
		./Usuaris/$n.sh $n
	;;
	N)
		echo "Crea nom d'usuari: "
		read n

		echo "Contrasenya: "
		read p

		echo "$n $p" >> BaseDeDades.txt
		touch Usuaris/$n.sh
		chmod 777 Usuaris/*.sh
		usuari > Usuaris/$n.sh
		eixir=1
		./Usuaris/$n.sh $n
	;;
	*)
		echo "Introducció incorrecta"
	;;
esac
done
