#!bin/bash
#update test user files
file=$1
filedir=$2
user=prouser
ip=10.221.156.137

#update file
echo -e "\033[33m ================Start file update================ \033[0m"
if [ -d $1 ]; then
   scp -r ./user/$file ${user}@${ip}:$filedir
else
   scp ./user/$file ${user}@${ip}:$filedir
fi
