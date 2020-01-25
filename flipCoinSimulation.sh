#!/bin/bash
echo "-------------------------------------------WELLOME FLIP COIN SIMULATION PROBLEM--------------------------------------------------"
HEAD=0;
TAIL=1;
declare -A CoinFlipDictionary
declare -A coinFlipDictonaryPercentage
function flipCoin(){
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
	CoinFlipDictionary[$str]=$((${CoinFlipDictionary[$str]}+1))
   coinFlipDictonaryPercentage[$str]=$((${coinFlipDictonaryPercentage[$str]}+1*100/$2))
done
}

sortPercentage()
{
	echo "--------------------------------------------------------------------------------------------------------------------------"
   for i in ${!coinFlipDictonaryPercentage[@]}
   do
      for j in ${!coinFlipDictonaryPercentage[@]}
      do
         if((${coinFlipDictonaryPercentage[$j]} < ${coinFlipDictonaryPercentage[$i]}))
         then
               temp=${coinFlipDictonaryPercentage[$i]}
               coinFlipDictonaryPercentage[$i]=${coinFlipDictonaryPercentage[$j]}
               coinFlipDictonaryPercentage[$j]=$temp
         fi
      done
   done
   echo "After Sorting : "
   echo "The Winning kes Accordingly: ${!coinFlipDictonaryPercentage[@]}"
   echo "The wining combination accordingly: ${coinFlipDictonaryPercentage[@]}"
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
echo ${!CoinFlipDictionary[@]}
echo ${CoinFlipDictionary[@]}
echo "------------------------------------------------------------------------------------------------------------------------------"
echo "Coin Percentage Respectively:"
echo ${!coinFlipDictonaryPercentage[@]}
echo ${coinFlipDictonaryPercentage[@]}

sortPercentage
