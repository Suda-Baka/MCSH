#Server Launcher
echo Stopping useless tasks... 
sleep 1
stop tmd
stop webreader
stop cmd
stop demd
stop dpmd
stop appmgrd
stop perfd
stop stackdumpd
stop kb
stop contentpackd
stop pillow
stop todo
stop rcm
stop otav3
stop otaupd
stop dynconfig
stop lipcd
stop archive
sleep 1
sysctl -w net.ipv4.ip_forward=1
port=$(grep 'port' server.properties)
iptables -A INPUT -i wlan0 -p tcp -m tcp --dport ${port##*=} -j ACCEPT
IP=$(ifconfig wlan0 | grep 'inet addr' | awk -F '[ :]' '{print $13}')
iptables -A FORWARD -p tcp -d ${IP} --dport 25565 -j ACCEPT
echo IP:${IP}
echo Port opened:"${port##*=}"
swapon /mnt/base-us/extensions/mcsh/bin/swapfile
lipc-set-prop -i com.lab126.powerd preventScreenSaver 1
echo Your server is starting.Please wait...
echo Your Kindle will REBOOT when the server is stopped.
echo Your server will start in 10s.
/mnt/us/extensions/mcsh/lib/jre/bin/java -jar -server -Xss1024k -Dlog4j.configurationFile=log4j2_17-111.xml server.jar nogui
echo Your server has stopped.Reboot your kindle now.
sleep 60
reboot
