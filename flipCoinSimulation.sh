#!/bin/bash
echo "-------------------------------------------WELLOME FLIP COIN SIMULATION PROBLEM--------------------------------------------------"
#CONSTANT
HEAD=0;
TAIL=1;

declare -A coinFlipDictionary

flipCoin(){
for (( i=0; i<$2; i++  ))
do
	str=""
	for (( j=0; j<$1; j++ ))
	do
		flip=$((RANDOM%2))
		if [ $flip -eq $HEAD ]
		then
			str="${str}H"
		else
			str="${str}T"
		fi
	done
	coinFlipDictionary[$str]=$((${coinFlipDictionary[$str]}+1))
done
}
getPercentage(){
for i in ${!coinFlipDictionary[@]}
do
	coinFlipDictionary[$i]=`echo "scale=2; ${coinFlipDictionary[$i]}*100/$flipCount" | bc`
done
}

sortPercentage(){
echo "--------------------------------------------------------------------------------------------------------------------------"
for i in ${!coinFlipDictionary[@]}
do
	for j in ${!coinFlipDictionary[@]}
	do
	if [ ${coinFlipDictionary[$i]%%.*} -gt ${coinFlipDictionary[$j]%%.*} ]
	then
		temp=${coinFlipDictionary[$i]}
		coinFlipDictionary[$i]=${coinFlipDictionary[$j]}
		coinFlipDictionary[$j]=$temp
	fi
	done
done
echo "After Sorting : "
echo "The Winning kes Accordingly: ${!coinFlipDictionary[@]}"
echo "The wining combination accordingly: ${coinFlipDictionary[@]}"
}
echo "1.One Coin"
echo "2.Two Coins"
echo "3.Three Coins"

echo "Enter the how many coins you want to flip:"
read -p "Enter Your choice:" coinCount
if [ $coinCount -lt 4 ]
then
	read -p "Enter the how many times:" flipCount
else
	echo "Invalid choice"
	coinCount=0
fi
echo "------------------------------------------------------------------------------------------------------------------------------"

flipCoin $coinCount $flipCount

echo "Coin Simulaton Respectively:"
echo ${!coinFlipDictionary[@]}
echo ${coinFlipDictionary[@]}

getPercentage $flipCount

echo "------------------------------------------------------------------------------------------------------------------------------"
echo "Coin Percentage Respectively:"
echo ${!coinFlipDictionary[@]}
echo ${coinFlipDictionary[@]}

sortPercentage
