#!/bin/bash
echo "-------------------------------------------WELLOME FLIP COIN SIMULATION PROBLEM--------------------------------------------------"
HEAD=0;
TAIL=1;
flipCoin=$((RANDOM%2))
if [ $flipCoin -eq $HEAD ]
then
	echo "HEAD"
else
	echo "TAIL"
fi
