#!bin/bash
#backup test files

user=prouser
ip=$1
backupdir=/opt/app/backup
currentdir=$(date "+%Y-%m-%d")

#Determine whether the directory exists, and create if it does not exists

ssh -T ${user}@${ip} <<EOF
   if [ ! -d "${backupdir}/${currentdir}" ]; then
      echo -e "\033[33m directory does not exist, creating。。。 \033[0m"
      cd $backupdir
      mkdir $currentdir
   else
      echo -e "\033[33m directory already exists,start backup files。。。 \033[0m"
  
   fi
   
EOF
#backup file
for i in ` awk '{print $1}' backup.txt `
{
ssh -T ${user}@${ip} <<EOF
   echo -e "\033[33m Get file directory, start backup。。。 \033[0m"
   echo $i
   cp $i ${backupdir}/${currentdir}
EOF

}
echo -e "\033[33m backup success \033[0m"
