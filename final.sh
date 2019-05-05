ip address show eth0
ip route list 0.0.0.0/0
cat /etc/sysconfig/network-scripts/ifcfg-eth0 | grep ONBOOT
cat /etc/sysconfig/network-scripts/ifcfg-static | grep ONBOOT
nmcli con show
hostnamectl
cat /etc/hosts
systemctl static httpd
systemctl list-unit-files | grep httpd
cat /var/www/html/index.html
ls -l ~
ssh rhs2 << EOF
ip address show eth0
ip route list 0.0.0.0/0
cat /etc/sysconfig/network-scripts/ifcfg-eth0 | grep ONBOOT
cat /etc/sysconfig/network-scripts/ifcfg-static | grep ONBOOT
nmcli con show
hostnamectl
cat /etc/hosts
ls -l ~
EOF
