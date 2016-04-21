#!/bin/bash
clear
echo ""
echo "=========================================================================="
echo "                        欢迎使用 NodeJs 版 RProxy                         "
echo "                                                                          "
echo "     本脚本将会全自动的为您安装 Node 环境，整个过程将会耗费您将近 1-3 分钟"
echo "                                                                          "
echo " 的时间，请您耐心等待！谢谢！                                             " 
echo "                                                                          "
echo "                                                            by RBB        "
echo "=========================================================================="
echo ""
MATRIX="0123456789"
LENGTH="6"
while [ "${n:=1}" -le "$LENGTH" ]
do
	PASS="$PASS${MATRIX:$(($RANDOM%${#MATRIX})):1}"
    let n+=1
done
echo -e "\033[32;49;1m验证码：$PASS\033[39;49;0m"
echo ""
echo -n -e "\033[31;1m请输入上方验证码：\033[0m"
read code
echo ""
if [ $code != $PASS ]
then
  echo -e "\033[31;5m验证码错误，脚本退出！\033[0m"
  exit 0
fi

echo "验证码正确，脚本继续！"
echo ""

rm -f start.sh
rm -f stop.sh

#--------------------------------------------
echo "3秒后开始安装 NodeJs 环境"
sleep 3
clear
yum -y install nodejs
echo ""
echo "NodeJs 环境安装完成，3秒开始下载 RProxy"
echo ""
sleep 3
clear
rm -rf /usr/etc/RProxy
rm -rf /usr/etc/tool
rm -rf /usr/etc/RProxy-Admin
wget -q -P /usr/etc https://raw.githubusercontent.com/xinian2016/Temp/masternodejs-RProxy.tar.gz
tar xf /usr/etc/nodejs-RProxy.tar.gz -C /usr/etc
rm -f /usr/etc/nodejs-RProxy.tar.gz
wget https://raw.githubusercontent.com/xinian2016/Temp/master/restart.sh
wget https://raw.githubusercontent.com/xinian2016/Temp/master/start.sh
wget https://raw.githubusercontent.com/xinian2016/Temp/master/stop.sh
echo ""
echo "RProxy 下载完成，即将开始运行 RProxy"
sh start.sh
