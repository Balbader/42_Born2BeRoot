#!/bin/bash
free_ram=$(free -m | awk '$1 == "Mem:" {print $2}')
used_ram=$(free -m | awk '$1 == "Mem:" {print $3}')
perc_ram=$(free | awk '$1 == "Mem:" {printf("%.2f"), $3/$2*100}')

free_disk=$(df -BG | grep '^/dev/' | grep -v '/boot$' | awk '{ft += $2} END {print ft}')
used_disk=$(df -BM | grep '^/dev/' | grep -v '/boot$' | awk '{ut += $3} END {print ut}')
perc_disk=$(df -BM | grep '^/dev/' | grep -v '/boot$' | awk '{ut += $3} {ft+= $2} END {printf("%d"), ut/ft*100}')

wall "	#Architecture: $(uname -a)
		#CPU physical: $(lscpu | awk '$1 == "CPU(s):" {print $2}')
		#vCPU: $(cat /proc/cpuinfo | grep '^processor' | wc -l)
		#Memory Usage: $used_ram/${free_ram}MB ($perc_ram%)
		#Disk Usage: $used_disk/${free_disk}Gb ($perc_disk%)
		#CPU load: $(top -bn1 | grep '^%Cpu' | cut -c 9- | awk '{printf("%.1f%%"), $1 + $3}')
		#Last boot: $(who -b | grep 'system' | awk '{print $3 " " $4}')
		#LVM use: $(if [ $(lsblk | grep "lvm" | wc -l) -eq 0 ]; then echo no; else echo yes; fi)
		#Connections TCP: $(netstat | grep 'ESTABLISHED' | wc -l) ESTABLISHED
		#User log: $(users | wc -w)
		#Network: IP $(hostname -I)($(ip link show | grep "ether" | awk '{print $2}'))
		#Sudo: $(grep 'sudo' /var/log/sudo/sudo.log | wc -w) cmd"
