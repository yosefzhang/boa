#!/system/bin/sh
#sh iptables.sh dstip dstport cameraip
#Port forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward
/system/bin/iptables -F
/system/bin/iptables -F -t nat
/system/bin/iptables -P FORWARD DROP
/system/bin/iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
/system/bin/iptables -t nat -A PREROUTING -d $1 -p tcp --dport $2 -j DNAT --to $3:5000
/system/bin/iptables -A FORWARD -d $3 -p tcp --dport 5000 -j ACCEPT
/system/bin/iptables -t nat -A POSTROUTING -d $3 -j SNAT --to 192.168.43.1
