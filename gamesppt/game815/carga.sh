rm -rf eleccions.txt
nom=$1
aleatorio=$2
echo
echo "Enviat!"
echo
echo "Esperant..."
linies=`cat eleccio.txt | wc -l`

while [[ $linies -eq 1 ]]; do
	linies=`cat eleccio.txt | wc -l`
done

if [[ $linies -eq 2 ]]; then
	./server.sh $nom $aleatorio
fi
