
	nom=$1
	resultatBingoGlobal=`cat resultatsGlobals.txt | cut -d" " -f2`
	total=0
	for cadaNumero in $resultatBingoGlobal
	do
		let total=$cadaNumero+$total
	done

	for aquestsIntents in $resultatBingoGlobal
	do
		if [ $aquestsIntents -lt $total ]
		then
			total=$aquestsIntents
		fi
	done

	guanyador=`cat resultatsGlobals.txt | grep -w $total | cut -d" " -f1`
	intentsGuanyador=`cat resultatsGlobals.txt | grep -w $total | cut -d" " -f2`
	echo "$guanyador ha sigut el guanyador amb $intentsGuanyador intents"
	awk $1==N{$3+=1}1 N=\$guanyador ../../BaseDeDades.txt > ../../BaseDeDades.tmp
	mv ../../BaseDeDades.tmp ../../BaseDeDades.txt
	read jhdfjbhkjfgh
	cd ../..
	rm -r gamesBingo/game$aleatorio
	./Usuaris/$nom.sh $nom
