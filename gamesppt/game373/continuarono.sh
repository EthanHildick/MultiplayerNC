nom=$1
aleatorio=$2
eleccio1=`cat eleccions.txt | grep ^$nom | cut -d" " -f2`
eleccio2=`cat eleccions.txt | grep -v ^$nom | cut -d" " -f2`

elecciodefinitiva=`expr $eleccio1 \* $eleccio2`

case $elecciodefinitiva in
	0)
	echo "Partida cancelada!"
	read lkajhsdfdhasf
	cd ../..
	rm -r gamesppt/game$aleatorio	
	./pedrapapertisores.sh $nom
	;;
	
	1)
	echo "Partida acceptada!"
	read lakshlfkdhsf
	./$nom.sh $nom $aleatorio
	;;
esac
