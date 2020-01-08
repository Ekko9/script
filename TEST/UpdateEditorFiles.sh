#!bin/bash
#update test editor files
file=$1
filedir=$2
user=prouser
ip=***.***.***.***

#update file
echo -e "\033[33m ================Start file update================ \033[0m"
if [ -d $1 ]; then
   scp -r ./editor/$file ${user}@${ip}:$filedir
else
   scp ./editor/$file ${user}@${ip}:$filedir
fi
