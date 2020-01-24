#!/bin/bash
echo "-------------------------------------------WELLOME FLIP COIN SIMULATION PROBLEM--------------------------------------------------"
HEAD=0;
TAIL=1;
declare -A SingleCoinFlipDictionary
declare -A DoubleCoinFlipDictionary
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

echo "------------------------------------------------------------------------------------------------------------------"
for (( j=1; j<=12; j++ ))
do
firstFlip=$((RANDOM%2))
secondFlip=$((RANDOM%2))
#echo $firstFlip
#echo $secondFlip
	if [ $firstFlip -eq $HEAD -a $secondFlip -eq $HEAD ]
	then
		DoubleCoinFlipDictionary[HEADHEAD]=$((${DoubleCoinFlipDictionary[HEADHEAD]}+1*100/12))
	elif [ $firstFlip -eq $HEAD -a $secondFlip -eq $TAIL ]
	then
		DoubleCoinFlipDictionary[HEADTAIL]=$((${DoubleCoinFlipDictionary[HEADTAIL]}+1*100/12))
	elif [ $firstFlip -eq $TAIL -a $secondFlip -eq $HEAD ]
	then
		DoubleCoinFlipDictionary[TAILHEAD]=$((${DoubleCoinFlipDictionary[TAILHEAD]}+1*100/12))
	else
		DoubleCoinFlipDictionary[TAILTAIL]=$((${DoubleCoinFlipDictionary[TAILTAIL]}+1*100/12))
	fi
done

echo ${!DoubleCoinFlipDictionary[@]}
echo ${DoubleCoinFlipDictionary[@]}



























