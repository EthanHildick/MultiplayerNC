
   #!/bin/bash
#FUNCTIONS#
CAMPO_DE_BATALLA () {
	#es pot millorar aquest codi
	array0=( "·" "·" "·" "·" "·" "·" "·" "·" "·" "·" "·" )
	array1=( "·" "·" "·" "·" "·" "·" "·" "·" "·" "·" "·" )
	array2=( "·" "·" "·" "·" "·" "·" "·" "·" "·" "·" "·" )
	array3=( "·" "·" "·" "·" "·" "·" "·" "·" "·" "·" "·" )
	array4=( "·" "·" "·" "·" "·" "·" "·" "·" "·" "·" "·" )
	array5=( "·" "·" "·" "·" "·" "·" "·" "·" "·" "·" "·" )
	array6=( "·" "·" "·" "·" "·" "·" "·" "·" "·" "·" "·" )
	array7=( "·" "·" "·" "·" "·" "·" "·" "·" "·" "·" "·" )
	array8=( "·" "·" "·" "·" "·" "·" "·" "·" "·" "·" "·" )
	array9=( "·" "·" "·" "·" "·" "·" "·" "·" "·" "·" "·" )
	array10=( "·" "·" "·" "·" "·" "·" "·" "·" "·" "·" "·" )
}
MOSTRAR_CAMPO_DE_BATALLA () {
	#es pot millorar aquest codi
	clear
	echo "${array0[*]}""           ""---|---|---|---|---"
	echo "${array1[*]}""           "" Q |   | W |   | E "
	echo "${array2[*]}""           ""---|---|---|---|---"
	echo "${array3[*]}""           ""   | q | w | e |   "
	echo "${array4[*]}""           ""---|---|---|---|---"
	echo "${array5[*]}""           "" A | a |   | d | D "
	echo "${array6[*]}""           ""---|---|---|---|---"
	echo "${array7[*]}""           ""   | z | x | c |   "
	echo "${array8[*]}""           ""---|---|---|---|---"
	echo "${array9[*]}""           "" Z |   | X |   | C "
	echo "${array10[*]}""           ""---|---|---|---|---"
}
PERSONAGE () {
	if [ $juador = "X" ]
	then
		personaje="$juador"
		posicion=( "3" "3" )
	else
		personaje="$juador"
		posicion=( "7" "4" )
	fi
}
COMPROBACION_PERSONAJE () {
	x=`cat posicion$juador.txt | cut -d" " -f1`
	y=`cat posicion$juador.txt | cut -d" " -f2`
	X=`cat posicion$juadorContrincant.txt | cut -d" " -f1`
	Y=`cat posicion$juadorContrincant.txt | cut -d" " -f2`
	eval posicion$juadorContrincant[0]=$X
	eval posicion$juadorContrincant[1]=$Y
	posicion=( "$x" "$y" )
}
IR_A_POSICION () {
	x="${posicion[0]}"
	y="${posicion[1]}"
	eval array$y[$x]="$personaje"
	#X="${posicion$juadorContrincant[0]}" 
	#Y="${posicion$juadorContrincant[1]}"
	eval array$Y[$X]="$juadorContrincant"
	MOSTRAR_CAMPO_DE_BATALLA
}
MOVIMIENTO () {
	while true
	do
		read -e -n 1 direccion
		case $direccion in
			W)
				posicionAntigua=`echo "${posicion[1]}"`
				if [ $posicionAntigua -eq 1 ] #ací es pot posar una variable
				then
					posicionNueva=$posicionAntigua
					posicion[1]=$posicionNueva
				else
					let posicionNueva=$posicionAntigua-2
					posicion[1]=$posicionNueva
					break
				fi
			
			;;
			X)
				posicionAntigua=`echo "${posicion[1]}"`
				if [ $posicionAntigua -eq 9 ] #ací es pot posar una variable
				then
					posicionNueva=$posicionAntigua
					posicion[1]=$posicionNueva
				else
				let posicionNueva=$posicionAntigua+2
				posicion[1]=$posicionNueva
					break
				fi
			
			;;
			A)
				posicionAntigua=`echo "${posicion[0]}"`
				if [ $posicionAntigua -eq 1 ] #ací es pot posar una variable
				then
					posicionNueva=$posicionAntigua
					posicion[0]=$posicionNueva
				else
					let posicionNueva=$posicionAntigua-2
				posicion[0]=$posicionNueva
					break
				fi
		
			;;
			D)
				posicionAntigua=`echo "${posicion[0]}"`
				if [ $posicionAntigua -eq 9 ] #ací es pot posar una variable
				then
					posicionNueva=$posicionAntigua
					posicion[0]=$posicionNueva
				else
				let posicionNueva=$posicionAntigua+2
				posicion[0]=$posicionNueva
					break
				fi
		
			;;
			Q)
				posicionAntiguaX=`echo "${posicion[0]}"`
				posicionAntiguaY=`echo "${posicion[1]}"`
				if [ $posicionAntiguaX -eq 1 ]
				then
					echo -n #Inutil#Inutil
				elif  [ $posicionAntiguaY -eq 0 ]
				then
					echo -n #Inutil#Inutil
				else
					let posicionNuevaX=$posicionAntiguaX-2
					posicion[0]=$posicionNuevaX
					let posicionNuevaY=$posicionAntiguaY-2
					posicion[1]=$posicionNuevaY
					break
				fi
			
			;;
			E)
				posicionAntiguaX=`echo "${posicion[0]}"`
				posicionAntiguaY=`echo "${posicion[1]}"`
				if [ $posicionAntiguaX -eq 9 ]
				then
					echo -n #Inutil#Inutil
				elif  [ $posicionAntiguaY -eq 1 ]
				then
					echo -n #Inutil#Inutil
				else
					let posicionNuevaX=$posicionAntiguaX+2
					posicion[0]=$posicionNuevaX
					let posicionNuevaY=$posicionAntiguaY-2
					posicion[1]=$posicionNuevaY
					break
				fi
			
			;;
			Z)
				posicionAntiguaX=`echo "${posicion[0]}"`
				posicionAntiguaY=`echo "${posicion[1]}"`
				if [ $posicionAntiguaX -eq 1 ]
				then
					echo -n #Inutil#Inutil
				elif  [ $posicionAntiguaY -eq 9 ]
				then
					echo -n #Inutil#Inutil
				else
					let posicionNuevaX=$posicionAntiguaX-2
					posicion[0]=$posicionNuevaX
					let posicionNuevaY=$posicionAntiguaY+2
					posicion[1]=$posicionNuevaY
					break
				fi
			
			;;
			C)
				posicionAntiguaX=`echo "${posicion[0]}"`
				posicionAntiguaY=`echo "${posicion[1]}"`
				if [ $posicionAntiguaX -eq 9 ]
				then
					echo -n #Inutil#Inutil
				elif  [ $posicionAntiguaY -eq 9 ]
				then
					echo -n #Inutil#Inutil
				else
					let posicionNuevaX=$posicionAntiguaX+2
					posicion[0]=$posicionNuevaX
					let posicionNuevaY=$posicionAntiguaY+2
					posicion[1]=$posicionNuevaY
					break
				fi
			
			;;
			w)
				posicionAntigua=`echo "${posicion[1]}"`
				if [ $posicionAntigua -eq 0 ] #ací es pot posar una variable
				then
					posicionNueva=$posicionAntigua
					posicion[1]=$posicionNueva
				else
					let posicionNueva=$posicionAntigua-1
					posicion[1]=$posicionNueva
					break
				fi
		
			;;
			x)
				posicionAntigua=`echo "${posicion[1]}"`
				if [ $posicionAntigua -eq 10 ] #ací es pot posar una variable
				then
					posicionNueva=$posicionAntigua
					posicion[1]=$posicionNueva
				else
				let posicionNueva=$posicionAntigua+1
				posicion[1]=$posicionNueva
					break
				fi
		
			;;
			a)
				posicionAntigua=`echo "${posicion[0]}"`
				if [ $posicionAntigua -eq 0 ] #ací es pot posar una variable
				then
					posicionNueva=$posicionAntigua
					posicion[0]=$posicionNueva
				else
					let posicionNueva=$posicionAntigua-1
				posicion[0]=$posicionNueva
					break
				fi
			
			;;
			d)
				posicionAntigua=`echo "${posicion[0]}"`
				if [ $posicionAntigua -eq 10 ] #ací es pot posar una variable
				then
					posicionNueva=$posicionAntigua
					posicion[0]=$posicionNueva
				else
				let posicionNueva=$posicionAntigua+1
				posicion[0]=$posicionNueva
					break
				fi

			;;
			q)
				posicionAntiguaX=`echo "${posicion[0]}"`
				posicionAntiguaY=`echo "${posicion[1]}"`
				if [ $posicionAntiguaX -eq 0 ]
				then
					echo -n #Inutil#Inutil
				elif  [ $posicionAntiguaY -eq 0 ]
				then
					echo -n #Inutil#Inutil
				else
					let posicionNuevaX=$posicionAntiguaX-1
					posicion[0]=$posicionNuevaX
					let posicionNuevaY=$posicionAntiguaY-1
					posicion[1]=$posicionNuevaY
					break
				fi
			;;
			e)
				posicionAntiguaX=`echo "${posicion[0]}"`
				posicionAntiguaY=`echo "${posicion[1]}"`
				if [ $posicionAntiguaX -eq 10 ]
				then
					echo -n #Inutil#Inutil
				elif  [ $posicionAntiguaY -eq 0 ]
				then
					echo -n #Inutil#Inutil
				else
					let posicionNuevaX=$posicionAntiguaX+1
					posicion[0]=$posicionNuevaX
					let posicionNuevaY=$posicionAntiguaY-1
					posicion[1]=$posicionNuevaY
					break
				fi
				
			;;
			z)
				posicionAntiguaX=`echo "${posicion[0]}"`
				posicionAntiguaY=`echo "${posicion[1]}"`
				if [ $posicionAntiguaX -eq 0 ]
				then
					echo -n #Inutil#Inutil
				elif  [ $posicionAntiguaY -eq 10 ]
				then
					echo -n #Inutil#Inutil
				else
					let posicionNuevaX=$posicionAntiguaX-1
					posicion[0]=$posicionNuevaX
					let posicionNuevaY=$posicionAntiguaY+1
					posicion[1]=$posicionNuevaY
					break
				fi
				
			;;
			c)
				posicionAntiguaX=`echo "${posicion[0]}"`
				posicionAntiguaY=`echo "${posicion[1]}"`
				if [ $posicionAntiguaX -eq 10 ]
				then
					echo -n #Inutil#Inutil
				elif  [ $posicionAntiguaY -eq 10 ]
				then
					echo -n #Inutil#Inutil
				else
					let posicionNuevaX=$posicionAntiguaX+1
					posicion[0]=$posicionNuevaX
					let posicionNuevaY=$posicionAntiguaY+1
					posicion[1]=$posicionNuevaY
					break
				fi
				
			;;
			*)
			
			;;
		esac
	done
}
#MAIN PROGRAM#
nom=$1
juador=$2
juadorContrincant=$3
CAMPO_DE_BATALLA
MOSTRAR_CAMPO_DE_BATALLA
PERSONAGE
COMPROBACION_PERSONAJE
IR_A_POSICION
MOVIMIENTO
CAMPO_DE_BATALLA
IR_A_POSICION

echo "$x $y" > posicion$juador.txt
echo "$x $y" >> casillas.txt
tuX=`echo "${posicion[0]}"`
ellX=$X
tuY=`echo "${posicion[1]}"`
ellY=$Y

if [ $tuX -eq $ellX ] && [ $tuY -eq $ellY ] 
then
	echo "Has guanyat!"
    awk '$1==N{$3+=1}1' N=$nom ../../BaseDeDades.txt > ../../BaseDeDades.tmp
	mv ../../BaseDeDades.tmp ../../BaseDeDades.txt
	read safasfasfasdf
	cd ../..
	./Usuaris/$nom.sh $nom
fi 
./carga.sh $nom $juador $juadorContrincant
    
