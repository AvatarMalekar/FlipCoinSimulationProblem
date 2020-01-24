#!/bin/bash
echo "-------------------------------------------WELLOME FLIP COIN SIMULATION PROBLEM--------------------------------------------------"
HEAD=0;
TAIL=1;
declare -A SingleCoinFlipDictionary
for (( i=1; i<=12; i++ ))
do
flipCoin=$((RANDOM%2))
	if [ $flipCoin -eq $HEAD ]
	then
		SingleCoinFlipDictionary[HEAD]=$((${SingleCoinFlipDictionary[HEAD]}+1*100/12))
	else
		 SingleCoinFlipDictionary[TAIL]=$((${SingleCoinFlipDictionary[TAIL]}+1*100/12))
	fi
done
echo ${!SingleCoinFlipDictionary[@]}
echo "Percentage respectively:"
echo ${SingleCoinFlipDictionary[@]}
