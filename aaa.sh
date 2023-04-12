#!/bin/bash
###
# Provides:          aaa
# 循环读写内存文件防止cpu休眠
###
#程序开始
while :
do
     FILENAME=AAA #文件名称
     HZNAME=txt #文件的后辍格式名
     PATHNAME=tmp #文件路径
     GG=10 #设定文件内到达清除的行数进行清除文件内容
     cd /$PATHNAME
     if [ -f "/$PATHNAME/$FILENAME.$HZNAME" ];then
     #echo "文件存在"  
     echo ""
     else
     touch $FILENAME.$HZNAME 
     echo "   程序开始..." > $FILENAME.$HZNAME
     echo "正在创建文件..."
     fi #判断文件是否存在，不存在则创建。
     SJ=`openssl rand -base64 8 ` # 8是8位的意思
     #echo "随机字符$SJ"
     time=`date +%Y-%m-%d-%H%M%S` #当前系统日期时间
     #echo "当前日期时间 $time"
    echo $SJ$time >> $FILENAME.$HZNAME #输出字符串到文件
    HS=`sed -n '$=' $FILENAME.$HZNAME` #返回文件行数
    #echo $HS 
     if test $HS -gt  $GG; then
     rm -rf $FILENAME.$HZNAME
     touch $FILENAME.$HZNAME 
     echo "   程序开始..." > $FILENAME.$HZNAME  
     else
     echo "未达到清理的行数，当前行数 $HS行... 设定清理行数为 $GG行" 
     HSWB=`sed -n ''$HS'p' $FILENAME.$HZNAME` #或取当前文本行数内容
     echo "$HS行文本为 $HSWB"  
     fi #判断文件到达一定的数量后清除文件内的内容
    sleep 5 #休眠5秒
done
#程序结束
exit 0


