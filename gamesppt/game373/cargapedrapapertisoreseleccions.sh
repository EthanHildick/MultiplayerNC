
rm -rf eleccio.txt
nom=$1
aleatorio=$2
echo
echo -e "\e[33mEnviat!\e[0m"
echo
echo -e "\e[33mEsperant...\e[0m"
linies=`cat eleccions.txt | wc -l`

while [[ $linies -eq 1 ]]; do
	linies=`cat eleccions.txt | wc -l`
done

if [[ $linies -eq 2 ]]; then
	./continuarono.sh $nom $aleatorio
fi
