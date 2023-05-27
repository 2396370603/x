# x
aaa.sh 对内存读写文件，防止cpu休眠！
启动命令 bash aaa.sh &


----------------------------分割符----------------------------
# 23-05-27 
   packages.list 文件为openwrt_x86-64备份的安装插件包名
 备份命令： 
   opkg list-installed | cut -f 1 -d ' ' > /etc/config/packages.list #保存路径为 /etc/config ，可以在系统更新后仍保留下来。
 恢复命令： 
   opkg update
   cat /etc/config/packages.list | opkg install
   
   
   
   
----------------------------分割符----------------------------

##以下是本人用 openwrt x86-64固件 遇到的问题

# 📅 23-04-12
   openwrt x86-64固件使用时随时就刮掉了，进不去管理页面面。
   
   问题出现后登陆进入ssh，发送top`ps等命令都没有回应
   
   用ctrl+c也不能退出
   
   可以确定的是cpu在运行磁盘和网卡也在运行
   
   目前没有找到解决方法
#
 
 
