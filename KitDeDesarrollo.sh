#!/bin/bash
#FUNCTIONS



TUTORIAL () {
    echo "Ve a functions.txt y en la función usuari añade el nombre del juego al echo con los demás nombres de juegos y en el case añade una opción con el mismo número con el nombre de la carpeta y del fichero con el archivo .sh y después escribres \$nom por ejemplo: ./ahorcado/ahorcado.sh \$nom"
    read jasdfjsdkjg
}


NOMBRE_DEL_JUEGO () {
echo "Pon nombre al juego, se creará una carpeta y el fichero .sh con el nombre que será donde debes escribir tu propio código"
    read nombreDelJuego
    TUTORIAL
    mkdir $nombreDelJuego 
    touch $nombreDelJuego/$nombreDelJuego.sh
    chmod 777 *.sh
}

MULTIPLAYER () {
    echo "Se rellenará el fichero .sh con una plantilla para juegos online muy útil"
    read sagfasdfasdfasd
    plantillaEntrarPartida > $nombreDelJuego/$nombreDelJuego.sh
    plantillaCrearPartida >> $nombreDelJuego/$nombreDelJuego.sh
    plantillaEntrarOCrear >> $nombreDelJuego/$nombreDelJuego.sh
    cp funcionsPredeterminades.txt $nombreDelJuego
    chmod 777 $nombreDelJuego/*.sh
    echo "Ya puedes entrar a la carpeta del juego y editar todo lo que necesites, en el código tendrás instrucciones..."
    gnome-terminal -e "bash -c ./editarFunctions.sh;bash"
	sudo gedit $nombreDelJuego/$nombreDelJuego.sh
}



#MAIN PROGRAM
nom=$1
source functionsKitDeDesarrollo.txt
echo "Esta función te ayudará a crear tus propios juegos!"
echo "Tu juego será para un jugador o multijugador?"
jugadores=0
while [ $jugadores -eq 0 ]
do
    echo -n "Escribe S si quieres que sea para un jugador y M si quieres que sea para más de uno... "
    read cantidadJugadores
    case $cantidadJugadores in
        S)
        jugadores=1
        NOMBRE_DEL_JUEGO
        sudo gedit $nombreDelJuego/$nombreDelJuego.sh
        ;;
        M)
        jugadores=1
        NOMBRE_DEL_JUEGO
        MULTIPLAYER
        ;;
    esac
done
./Usuaris/$nom.sh $nom
