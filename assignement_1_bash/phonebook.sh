#!/bin/bash
export MYLINES=6
cd /home/hammam/Documents/
if [ ! -f phonebookDB.txt ]
then
touch phonebookDB.txt
cd -
fi 
if [ $1 = "-i" ]
then
read -p "enter name: " op1 
read -p "enter number: " op2
echo "contact name is: ' $op1 '"  "and number is : ' $op2 '" >> /home/hammam/Documents/phonebookDB.txt

elif [ $1 = "-s" ]
then
read -p "please enter contact name or number : " name
grep $name /home/hammam/Documents/phonebookDB.txt | more 

elif [ $1 = "-e" ]
then
echo "" > /home/hammam/Documents/phonebookDB.txt 
less /home/hammam/Documents/phonebookDB.txt 

elif [ $1 = "-v" ]
then
more phonebookDB.txt

elif [ $1 = "-d" ]
then
read -p "enter name to delete: " del 
grep "$del" /home/hammam/Documents/phonebookDB.txt >> file1
if [ $(wc -l < file1) -gt 2 ]
then 
echo print full name please.
else
sed -i "/$del/d" /home/hammam/Documents/phonebookDB.txt
fi
echo "" > file1
fi
