#!/bin/bash
cd ~
if [ ! -f TRASH ]
then
mkdir TRASH
cd -
fi
find ~/TRASH -name *.tar.gz -type f -atime +2 -delete
for i in $@
do

if [ -f "$i" ] || [ -d "$i" ]
then
gzip -t $i 2>/dev/null

if [[ $? -eq 0 ]]
then
mv $i ~/TRASH

else
tar czf $i.tar.gz $i
mv $i.tar.gz ~/TRASH

if [ -f "$i" ]
then 
rm $i
elif [ -d "$i" ]
then 
rm -r $i
fi 
fi
fi

done
