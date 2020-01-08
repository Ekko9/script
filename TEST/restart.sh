#!bin/bash
#Restart service
serverName=$1
ip=$2
restartdir=/opt/app/jboss-eap-5.2/jboss-as/server/SCTEST${serverName}Server/bin
ps_out=` ps -ef|grep SCTEST${serverName}Server |grep -v grep `

#Determine whether the process exists. If it does not exist, restart it. If it exists, close it before restarting
ssh -T prouser@$ip <<EOF
if  ${ps_out} > /dev/null
then
    echo "runing....."
    cd $restartdir	
    sh shutdownSCTEST${serverName}Server.sh
    sh startSCTEST${serverName}Server.sh
else
    echo "Process does not exist,start service....."
    cd $restartdir
    sh startSCTEST${serverName}Server.sh
fi
EOF
