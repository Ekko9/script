#!/bin/bash
#restart app

user1=jboss5deploy
user2=jbossdeploy
ps_out=` ps -ef|grep SC |grep -v grep `
echo "**********选择重启应用*******************"
echo "**********1——Service*********************"
echo "**********2——Editor**********************"
echo "**********3——User************************"
echo "**********4——Report**********************"
echo "**********5——Location********************"
echo "**********6——Config**********************"
echo "**********7——TRPAPI**********************"
#Determine whether the process exists. If it does not exist, restart it. If it exists, close it before restarting
read -p "请选择操作类型：" choose
case $choose in
    1)
    echo "正在重启Service。。。"
    for i in ***.***.***.{88..102}
    do
	echo $i
	ssh -T $user1@$i <<EOF
	if  ${ps_out} > /dev/null
	then
	    echo "runing....."	
	    cd /opt/app/jboss-eap-5.2/jboss-as/server/SCXdistServer/bin
 	    sudo -u jboss5 ./shutdownSCXdistServer.sh
	    sudo -u jboss5 ./startSCXdistServer.sh
	    sleep 3
	else
	    echo "Process does not exist,start service....."
	    cd /opt/app/jboss-eap-5.2/jboss-as/server/SCXdistServer/bin
	    sudo -u jboss5 ./startSCXdistServer.sh
	fi
	echo ${i}”重启完成“
	exit
EOF
    done
    ;;
    2)
    echo "正在重启Editor。。。"
    for i in ***.***.***.3{3..5}
    do
        echo $i
        ssh -T $user1@$i <<EOF
	if  ${ps_out} > /dev/null
        then
	    echo "runing....."
            cd /opt/app/jboss-eap-5.2/jboss-as/server/SCEditorServer/bin
	    sudo -u jboss5 ./shutdownSCEditorServer.sh
	    sudo -u jboss5 ./startSCEditorServer.sh
	    sleep 3
	else
	    echo "Process does not exist,start service....."
	    cd /opt/app/jboss-eap-5.2/jboss-as/server/SCEditorServer/bin
	    sudo -u jboss5 ./startSCEditorServer.sh
	fi
	echo ${i}”重启完成“
        exit
EOF
    done
    ;;
    3)
    echo "正在重启USER。。。"
    for i in ***.***.***.{78..80}
    do
        echo $i
        ssh -T $user1@$i <<EOF
	if  ${ps_out} > /dev/null
        then
            echo "runing....."
            cd /opt/app/jboss-eap-5.2/jboss-as/server/SCUserServer/bin
	    sudo -u jboss5 ./shutdownSCUserServer.sh
	    sudo -u jboss5 ./startSCUserServer.sh
	    sleep 3
	else
	    echo "Process does not exist,start service....."
	    cd /opt/app/jboss-eap-5.2/jboss-as/server/SCUserServer/bin
	    sudo -u jboss5 ./startSCUserServer.sh
	fi
	echo ${i}”重启完成“
        exit
EOF
    done
    ;;
    4)
    echo "正在重启Report。。。"
    for i in ***.***.***.{70..72}
    do
        ech
        ssh -T $user1@$i <<EOF
	if  ${ps_out} > /dev/null
        then
            echo "runing....."
            cd /opt/app/jboss-eap-5.2/jboss-as/server/SCReportServer/bin
	    sudo -u jboss5 ./shutdownSCReportServer.sh
	    sudo -u jboss5 ./startSCReportServer.sh
	    sleep 3
	else
	    echo "Process does not exist,start service....."
	    cd /opt/app/jboss-eap-5.2/jboss-as/server/SCReportServer/bin
	    sudo -u jboss5 ./startSCReportServer.sh
	fi
	echo ${i}”重启完成“
        exit
EOF
    done
    ;;
    5)
    echo "正在重启Location。。。"
    for i in ***.***.***.8{5..7}
    do
	echo $i
	ssh -T $user2@$i <<EOF
	if  ${ps_out} > /dev/null
        then
            echo "runing....."
	    cd /opt/app/jboss-eap-7.1/SCLocationServer/bin
	    sudo -u jboss ./shutdownSCLocationServer.sh
	    sudo -u jboss ./startSCLocationServer.sh
	    sleep 3
	else
	    echo "Process does not exist,start service....."
	    cd /opt/app/jboss-eap-7.1/SCLocationServer/bin
	    sudo -u jboss ./startSCLocationServer.sh
	fi
	echo ${i}”重启完成“
	exit	
EOF
    done
    ;;
    6)
    echo "正在重启Config。。。"
    for i in ***.***.***.{82..84}
    do
        echo $i
        ssh -T $user2@$i <<EOF
	if  ${ps_out} > /dev/null
        then
            echo "runing....."
            cd /opt/app/jboss-eap-7.1/SCCloudServer/bin
	    sudo -u jboss ./shutdownSCCloudServer.sh
	    sudo -u jboss ./startSCCloudServer.sh
	    sleep 3
	else
	    echo "Process does not exist,start service....."
	    cd /opt/app/jboss-eap-7.1/SCCloudServer/bin
	    sudo -u jboss ./startSCCloudServer.sh
	fi
	echo ${i}”重启完成“
        exit
EOF
    done
    ;;
    7)
    echo "正在重启TRPAPI。。。"
    for i in ***.***.***.{103..122}
    do
        echo $i
        ssh -T $user2@$i <<EOF
	if  ${ps_out} > /dev/null
        then
            echo "runing....."
            cd /opt/app/jboss-eap-7.1/SCIbeServer/bin
	    sudo -u jboss ./shutdownSCIbeServer.sh
	    sudo -u jboss ./startSCIbeServer.sh
	    sleep 3
	else
	    echo "Process does not exist,start service....."
	    cd /opt/app/jboss-eap-7.1/SCIbeServer/bin
	    sudo -u jboss ./startSCIbeServer.sh
	fi
	echo ${i}”重启完成“
        exit
EOF
    done
    ;;
esac

