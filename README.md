
# Born 2 Be Root Guide

##  Synopsis

This project aims to introduce you to the wonderful world of virtualization.<br><br>
You will create your first machine in `VirtualBox` under specific instructions. Then at the end of this profect, you will be able to set up your own operating system while implementing strict rules.<br><br>
This guide includes the `Bonus` section of the project<br>
## Contents

- [Why?](#why)
- [Recommended Methodology](#Recommended-Methodology)
- [System](#System)
- [Part 1 - Downloading Your VM](#Part-1---Downloading-Your-VM)
- [Part 2 - Installing Your VM](#Part-2---Installing-Your-VM)
- [Part 3 - Starting Your VM and Partitioning Your Disk Manually](#Part-3---Starting-Your-VM-and-Partitioning-Your-Disk-Manually)
- [Part 4 - Configuration of Your VM - Part 1](#Part-4---Configuration-of-Your-VM---Part-1)
- [Part 5 - SSH Connection](#Part-5---SSH-Connection)
- [Part 6 - Configuration of Your VM - Part 2](#Part-6---Configuration-of-Your-VM---Part-2)
- [Part 7 - Bonus](#Part-7---Bonus)
- [Part 8 - Signature File](#Part-8---Signature-File)

## Why?

- To provide an easy to follow, step-by-step guide to help you understand the intricacies of the 42 - B2BR Project.

## Recommended Methodology

The main goal of this guide is for it to serve as a starting point for you to conduct an indepth research in regards to each step presented.<br>
If you intend to follow this guide, I highly recommend the following methodology in order for you to get the most out of it.<br>
<br>
For every part of this guide, you will be introduced to specific commands:

	1. Google the command and read the documentation for each one. The idea is to get   a general understanding of what the command does.
	2. Try the command outside of the project. Open a terminal and try typing the command and see what value or information it retruns.
	3. Take notes: When reading the doc, make sure to summarize what you understood for each command. Make a short description of what the command does and how it is used.
	4. Do not move to the next step of this guide if you are not comfortable with the current one.

When there is a `To Check` section, use it as a starting point for the extra research that needs to be done.<br>

## System

The system on which this project was executed:

	OS: Ubuntu 22.04.1 LTS x86_64
	Host: iMac13,2 1.0
	Kernel: 5.15.0-53-generic
	Shell: zsh 5.8.1
	CPU: Intel i5-3470S (4) @ 3.600GHz
	Memory: 3173MiB / 7888MiB


## Part 1 - Downloading Your VM

1.  Go to the official Debian website and download the following `.iso` file:<br>[https://www.debian.org/download](https://www.debian.org/download)

### Part 1.1 - Setting Up Your Environment
> For 42 Machines

1. CD into your sgoinfre folder:<br>`cd sgoinfre`

2. Create a folder named after you student intra login followed by the number 42:<br>`mkdir <your intra login42>`

 3. Change authorization on the directory you just created:<br>`chmod 777 <your intra login42`

4. Move the Debian .iso file you downloaded from downloads folder to the folder you just created.

## Part 2 - Installing Your VM

1. Start `VirtualBox
2. Click on `New`
3. Give you new machine's name your intra login followed by the number 42
4. Change your machine's location to the folder you created, located in sgoinfre
5. Select `Linux` as your machine type
6. Your machine version should be `Oracle (64)`
7. Click `Continue`
8. Make sure to have `1024` for Memory Size then click `Next`
9. In the Hard Disk section, select `Create a virtual hard disk now` and click `Create`
10. In the Hard Disk file type select `VDI` then click `Next`
11. In the Storage Section select `Dynamically allocated` followed by `Next`
12. Set the size of your storage to `32.00 GB` followed by `Continue`
13. Your machine should now appear in the `Tools` section of the `VirtualBox` software
14. Select your machine and click on `Settings`
15. Select the `Storage` section to view your VM Storage
16.  In the `Storage Devices` section, select the `Empty` field under `Controller: IDE`
17. Then, click on the blue CD on the far right of the `Optical Drive` section and select this `.iso` file you downloaded from the Debian website, then click `OK` (you should see the `Empty` field change to the name of the file you selected)
18. Now you can start you VM by clicking on the `Start` (green arrow)

## Part 3 - Starting Your VM and Partitioning Your Disk Manually

1. Start you VM by clicking on the `Start` (green arrow)
2. Select `Install`
3. Select `English` for the language selection
4. Select your location
5.  Enter your Intra login ending with `42` as the `Hostname` for the system then click `Continue`
6. Leave the Domain name empty and click `Continue`
7. Enter a `Root password`, make sure to write it down as you will need it later
8. Enter a `user name` , can be your intra login without `42` then click `Continue`
9. Enter a password for the user you just created
10. Make sure to write down the user name and password you just entered as you will need them later
11. In the `Partitioning method` select `Manual`

### 3.1 - Primary Partition

1. Then select the `SCSI1 (0,0,0) (sda)` option
2. Select `Yes` for the `Create new empty partition table on this device?` section
3. Select the `pri/log` line
4. Select `Create a new partition` for the `How to use this free space` section
5. For the `New partition size` enter `500M` then click `Continue`
6. For the type select `Primary` and `Beginning` as its Location
7. In the `Partition settings` select the `Mount point: /` option
8. Then select the `/boot` option , in the `erase data` section select `no` this will allow to minimize the size of the `.vdi` file and therefore, shorten the generation time of the `signature.txt` file.
9. Then, select `Done setting up the partition` to finish the partitioning process of the first disk

### 3.2 - Logical Volume

1. Select the `pri/log` linehen 
2. Select `Create a new partition` for the `How to use this free space` section
3. For the `New partition size` enter `max` then click `Continue`
4. For the type select `Logical`
5. In the `Partition settings` select the `Mount point: /` option
6. Then select the `Do not mount it` option
7. Then, select `Done setting up the partition` to finish the partitioning process of the first disk

### 3.3 - Configure encrypted volumes

1. Select `Configure  encrypted volumes` in the Partition Disks main menu
2. Select `Yes` to the `Write the changes to disk and configure encrypted volumes?`
3. Select `Create encypted volumes`
4. In the `Devices to encrypt` window, use your spacbar to select `/dev/sda5` followd by `Continue`
5. On the `Partition settings` select `Done setting up the partition`
6. Then select `Finish`
7. Then select `Yes` to `Really erase the data on SCSI! (0,0,0), partition #5 (sda)?`
8. Enter a password and confirm the password

### 3.4 - Configure the Logical Volume Manager

1.  In the Partition Disks main menu, select the `Configure the Logical Volume Manager` option
2. Then select `Yes` to `Write the changes to disk and configure LVM`
3. In the `LVM configuration action` select the `Create volume group` option
4. Give it `LVMGroup` as a name
5. Unsing your spacebar, select the `/dev/mapper/sda5_crypt` option
6. Select `Create logical volume` option and select the `LVMGroup` as the location where it should be created
7. Name it as `root`
8. and give it a total space of `10G`
9. Select `Create logical volume` option and select the `LVMGroup` as the location where it should be created
10. Name it as `swap`
11. and give it a total space of `2.3G`
12. Select `Create logical volume` option and select the `LVMGroup` as the location where it should be created
13. Name it as `home`
14. and give it a total space of `5G`
15. Select `Create logical volume` option and select the `LVMGroup` as the location where it should be created
16. Name it as `var`
	1. and give it a total space of `3G`
17. Select `Create logical volume` option and select the `LVMGroup` as the location where it should be created
18. Name it as `srv`
19. and give it a total space of `3G`
20. Select `Create logical volume` option and select the `LVMGroup` as the location where it should be created
21. Name it as `tmp`
22. and give it a total space of `3G`
23. Select `Create logical volume` option and select the `LVMGroup` as the location where it should be created
24. Name it as `var-log`
25. and give it a total space of `4G`
26. Then select `Finish`

### 3.5 - Mounting your LVM's

1. Select `#1` under the `LV home` line
2. In the `Partition settings` select the `Use as: do not use` option`
3. In the `How to use this partition` menu, select the `Ext4 journaling file system` option
4. Then select `Mount point` option and select the `/home` directory
5. Then select `Done setting up the partition`

Repeat steps 65 through 69 for all your `LVM` but make sure to select the correct `Mount point` directory for each of them.

> NOTE: <br>
> Make sure to select `swap area` for the `use as:` option<br>
> For the `var--log` LVM, select `Ext4 journaling file system` and <br>as its `Mount point option` select `enter manually` and enter: `/var/log`

### 3.6 - Finishing the Patitioning process

1. Select `Finish partitioning and write changes to disks`
2. Select `Yes` to `Write the changes to disks?`
3. Select `No` for `Scanextra installation media ?`
4. Select your country
5. Select `deb.debian.org` in the Debian archive mirror menu
6. Leave the `proxy information` blanc
7. Select `No` for `participating in the survey`
8. In the `Choose software to install` , make sure to unselect `SSH server` and `Standard system utilities` then click `Continue`
9. Select `Yes` for `Install the GRUB boot loader to your primary drive ?`
10. Select the `/dev/sda` option and click `Continue`
11. Select `Continue` for `Installation complete`
12. Once you VM has restarted, and you are in `/home/hostname` directory, type `lsblk` and compare your partitions with the ones in the bonus part of the subject.

## Part 4 - Configuration of Your VM - Part 1

### 4.1 - Installing `sudo`

1. In order to install `sudo` you need to be loged as root user. To switch to `root` type `su -` and enter your password when requested.
3. Once in root mode:<br>`apt update -y`<br>`apt upgrade -y`<br>`apt install sudo`<br>
4. Verify that `sudo` was properly installed:<br>`dpkg -l | grep sudo`

To check:
-  apt vs apt-get vs aptitude
-  sudo
-  giving root privileges to user

### 4.2 - Add user to `sudo` group
1. Add User:<br>`usermod -a -G sudo <user_name>`
2. Verify user has been added to group:<br>`getent group sudo`
3.  Open `sudoers` file and give `root` privileges to the added user:<br>`sudo visudo`
4. Search for the `# User privilege specification` and add:<br>`your <user_name> ALL=(ALL) ALL` 
5. exit sudo mode by typing:<br>`exit`


### 4.3 - Installing git and vim

1. Install git:<br>`sudo apt install git -y`
2. Check git version:<br>`git --version`
3. Install vim:<br>`sudo apt install vim -y`
4. Check vim version:<br>`vim --version`

### 4.4 - Install and configure SSH (Secure Shell Host)

1. Install SSH:<br>`sudo apt install openssh-server -y`
2. Check SSH status:<br>`sudo systemctl status ssh`
3. Edit sshd config file to change Port:<br>`sudo vim /etc/ssh/sshd_config`
4. Replace `#Port 22` with `Port 4242`
5. Finally, verify that the Port change was done:<br>`sudo grep Port /etc/ssh/sshd_config`
6. Restart SSH:<br>`sudo service ssh restart`

- To Check:
- `openssh-server`
- `systemctl`
- `service`

### 4.5 - Install and configure UFW (Uncomplicated FireWall)

1. Install UFW:<br>`sudo apt install ufw -y`
2. Enable UFW on your system:<br>`sudo ufw enable`
3. Check UFW status:<br>`sudo ufw status`
4. Allow SSH protocol :<br>`sudo ufw allow ssh`
5. Allow 4242 protocol:<br>`sudo ufw allow 4242`
6. Check UFW status and list UFW rules:<br>`sudo ufw status numbered`

- To Check:
- `UFW`

## Part 5 - SSH Connection

1. Turn off your VM
2. Open your VM settings
3. Select the `Network` option
4. Select `Adapter 1`
5. Select `Abanced`
6. Select `Port Forwarding`
7. If no rule is visible click the green `+` button
8. Add `4343` as a `Host Port` and `4242` as a `Guest Port`
9. Click `OK`
10. Start your VM
11. Check your SSH status:<br>`sudo systemctl status ssh`
12. Open your inhouse terminal
13. Connect to your VM via `ssh`:<br>`ssh your_username@127.0.0.1 -p 4242`
14. Enter your password when requested
15. At this point you should be connected to you VM

> NOTE:
> At this point, if you connected successfully to your VM, you should be able to continue the following steps directly on your inhouse terminal as long as you are connected to your VM.

## Part 6 - Configuration of Your VM - Part 2

### 6.1 - Setting Strong Password Policy

1. Install the `pam-pwquality` library:<br>`sudo apt install libpam-pwquality -y`
2. Edit the `common-password` file :<br>`sudo vim /etc/pam.d/common-password`
3. Find the line:<br>`password    requisite    pam_deny.so retry=3`
4. At the end of this line, after `retry=3` add the following:<br>`minlen=10 ucredit=-1 dcredit=-1 maxrepeat=3 refect_username difok=7 enforce_for_root`

- To Check:
- `pam-quality`
-  `minlen=10 ucredit=-1 dcredit=-1 maxrepeat=3 refect_username difok=7 enforce_for_root`

### 6.2 - Setting Password Change Policy

1. Edit the `login.defs` file :<br>`sudo vim /etc/login.defs`
2. Change the `PASS_MAX_DAYS` `PASS_MIN_DAYS` and `PASS_WARN_AGE` to `30`, `2` and `7`
3. Once you are done, if you are on your inhouse terminal, exit your VM by typing `exit`
4. Go back to your actuall VM and reboot the system:<br>`sudo reboot`

### 6.3 - Creating the `user42` and `evaluating` groups

1. Create `user42` group:<br>`sudo groupadd user42`
2. Create `evaluating` group:<br>`sudo groupadd evaluating`
3. Check if groups were created successfully:<br>`getent group user42 evaluating`

- To Check:
- `groupadd`
- `getent`

### 6.4 - Creating and assigning a user to a group

1. Check the list of all users on your system:<br>`cut -d: -f1 /etc/passwd`
2. Create a user:<br>`sudo adduser new_user_name`
3. Add the user you created with your intra login to the `user42` group:<br>`sudo usermod -a -G user42 your_intra_username`
4. Add the `new_user_name` to the `evaluating` group:<br>`sudo usermod -a -G evaluating new_user_name`
5. Check if both users were correctly added to their respective groups:<br>`getent group user42 evaluating`
6. To check to which groups a user belongs to:<br>`groups user_name`
7. Finally check if the password rules established are applied to user:<br>`sudo chage -l user_name`

- To Check:
-  `adduser`
- `groups`
- `chage`

### 6.5 - Creating the `sudo.log` file

1. `cd` to your `/root` directory:<br>`cd ../../`
2. `cd` to the `/var/log` dirctory:<br>`cd var/log`
3. Check if a `sudo` folder exist:<br>`ls`
4. If not create it and `cd` into it:<br>`sudo mkdir sudo && cd sudo`
5. Create the `sudo.log` file:<br>`touch sudo.log`
6. Finally `cd` to your `/home` directory by typing:<br>`cd`

### 6.6 - Configuring the `sudoers` group

1. Open the `sudoers` file:<br>`sudo visudo`
2. Underneath the 3rd `Defaults` line add the following set of rules:
```
Defaults	badpass_message="Password is wrong, please try again!"
Defaults	passwd_tries=3
Defaults	logfile="/var/log/sudo.log"
Defaults	log_input, log_output
Defaults	requiretty
```
3. Save and exit the file

### 6.7 - Crontab Configuration

1. Install `net-tools`, a collection of base networking utilities for linux:<br>`sudo apt install net-tools -y`
2. `cd` into your `bin` folder located at :<br>`cd /usr/local/bin`
3. Create the following file:<br>`sudo touch monitoring.sh`
4. Change the access permission of the file:<br>`sudo chmod 777 monitoring.sh`
5. add the following to your `monitoring.sh` file:
```
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
```

6. Save and exit `monitoring.sh`
7. type `cd` to go back to your `/home` directory
8. Open your `sudoers` file :<br>`sudo visudo`
9. under `%sudo ALL=(ALL:ALL) ALL` add the following line:<br>`your_user_name   ALL=(ALL) NOPASSWD: /usr/local/bin/monitoring.sh`
10. Save and exit the file
11. Open the `crontab` file to add the display rule for your `monitoring.sh` script:<br>`sudo crontab -u root -e`
12. At the very bottom of the file add the following: <br>`*/10 * * * * /usr/local/bin/monitoring.sh`

## Part 7 - Bonus

### 1 - Installing `lighttpd`

1. Install Lighttpd:<br>`sudo apt install lighttpd -y`
2. Check the installation was successful:<br>`dpkg -l | grep lighttpd`
3. Allow incoming connections via Port 80:<br>` sudo ufw allow 80`
4. Check the rule was added:<br>`sudo efw status numbered`
5. Turn off you VM
6. Open your vm settings
7. Select `Network` -> `Advanced` -> `Port forwarding`
8. Click the green `+` to add a new rule for host port `8080` to forward to guest port 80

### 2 - Installation and Configuration of `MariaDB`

1. Install `mariadb-server` :<br>`sudo apt instal mariadb-server -y`
2. Check installation was successful:<br>`dpkg -l | grep mariadb-server`
3. `MariaDB` binaries have `man` pages. In order to view them, you need to install MAN:<br>`sudo apt install man -y`
4. Start interactive script to remove insecure default settings:
```
sudo mysql_secure_installation
Enter current password for root (enter for none): press enter
Switch to unix_sockt authentication [Y/n] n
Change the root password? [Y/n] n
Remove anonymous users? [Y/n] Y
Disallow root login remotly? [Y/n] Y
Remove test database and access to it? [Y/n] Y
Reload privilege tables now? [Y/n] Y
```

### 2.1 - Creation and Configuration of new DB

1. Log in to the MariaDB console:<br>`sudo mariadb`
2. Create a new db:<br>`CREATE DATABASE <database_name>;`
3. Check new DB was successfully created:<br>`SHOW DATABASES;`

### 2.2 - Creation of new user and privileges granting

1. Create a new user:<br>`CREATE USER 'user_name'@'localhost' IDENTIFIED BY 'password';`
2. Check new user was successfully created:<br>`SELECT User FROM mysql.user;`
3. Grant new user full privileges on created DB:<br>`GRANT ALL ON database_name.* TO 'user_name'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;`
4. Refresh the privileges as new ones were awarded:<br>`FLUSH PRIVILEGES;`
5. Check new privileges were granted successfully:<br>`SHOW GRANTS FOR 'user_name'@'localhost';` 
6. Exit MariaDB by typing:<br>`exit`
7. Log back to MariaDB via the user you created to check if the database `user` was successfully created:<br>`mariadb -u user_name -p`
8. Enter the passowrd for the user
9. Confirm database `user` has access to `Database`:<br>`ShOW DATABASES;`
10. Exit MariaDB by typing:<br>`exit`

### 3 - Installing PHP

1. Install `php-cgi` && `php-mysql`:<br>`sudo apt install php-cgi php-mysql`
2. Check the installation was successful:<br>`dpkg -l | grep php`

### 4 - Install and configure WordPress (Bonus Part 1)

### 4.1 - Installing WordPress

1. Install `wget`:<br>`sudo apt install wget`
2. Check the installation was successful:<br>`dpkg -l | grep wget`
3. Go to `https://wordpress.org/download/` and download the latest release `.tar.gz` file with `wget` and store the file in `~/var/www/html`:<br>`sudo wget http://wordpress.org/latest.tar.gz -P /var/www/html`<br>The `-P` will set the `/var/www/html` directory  as the the directory where all other files and subdirectories will be saved to. The default is the current directory.
4. Go to your `html` directory and check if the `wordpress` folder was downloaded correctly. If it was downloaded in you `/home` directory, make sure to move it to the `/var/www/html` directory.
5. Extract content from the downloaded `.tar` file:<br>`sudo tar -xzvf /var/www/html/latest.tar.gz`<br>`-xz`: filter the archive through `xz`<br>`-v`: verbosely list files processed<br>`-f`: use archive file
6. Remove the `.tar` file:<br>`sudo rm /var/www/html/latest.tar.gz`
7. Copy the content of `/var/www/html/wordpress` to `var/www/html`:<br>`sudo cp -r /var/www/html/wordpress/* /var/www/html`
8. Verify the cp was sucessful and delete the `wordpress` directory:<br>`sudo rm -rf /var/www/html/wordpress`

### 4.2 - Configuring WordPress

1. Create a WordPress config file:<br>`sudo cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php`
2. Open the config file you just created:<br>`sudo vim /var/www/html/wp-config.php`
3. Replace lines:<br>`23 define( 'DB_NAME', 'database_name_here');`<br>`26 define( 'DB_USER', 'username_here');`<br>`29 define( 'DB_PASSWORD', 'password_here');`<br> with:<br>`23 define( 'DB_NAME', 'your_database_name');`<br>`26 define( 'DB_USER', 'your_username');`<br>`29 define( 'DB_PASSWORD', 'your_password');`
4. In your browser, go to `http://127.0.0.1:8080` and finish WordPress Setup.

### 5 - Configuring Lighttpd

1. Enable the following modules:<br>`sudo lighty-enable-mod fastcgi`<br>`sudo lighty-enable-mod fastcgi-php`<br>`sudo service lighttpd force-reload`

### 6 - File Transfer Protocol (Bonus Part 2)

1. Install `FTP`:<br>`sudo apt install vsftpd -y`<br>`vsftpd` is a secure and fast FTP server for UNIX-like systemsl.
2. Check the install was successful:<br>`dpkg -l | grep vsftpd`
3. Allow with `ufw` incoming connections user `Port 21`:<br>`sudo ufw allow 21`
4. Check ufw status:<br>`sudo ufw status numbered`
5. Configure `vsftpd`:<br>`sudo vim /etc/vsftpd.conf`<br>in the `vsftpd.conf` file, uncomment line 31
6. Set the root folder for the FTP-connected user to `/home/unser_name/ftp`<br>In your home/username directory create the following:<br>`sudo mkdir /home/<username>/ftp`<br>`sudo mkdir /home/<username>/ftp/files`<br>`sudo chown nobody:nogroup /home/<username>/ftp`<br>`sudo chmod a-w /home/<username>/ftp`
7. Open your `vsftpd.conf` file and add the following under `#Customization`:<br>`user_sub_token=$USER`<br>`local_root=/home/$USER/ftp
8. Open your `vsftpd.userlist` file:<br>`sudo vim /etc/vsftpk.userlist` and add the following:<br>`userlist_enable=YES`<br>`userlist_file=/etc/vsftpk.userlist`<br>`oserlist_deny=NO`

### 7 - Connect to your VM Server via `ftp`

1. `ftp <ip-address>` 
2. `ctrl + d` to terminate session.

## Part 8 - Signature File

1. Go to your vm folder
2. Generate a signature id number:<br>`shasum` followed by `.vdi` file<br>`shasum Vm_file_name.vdi`
3. Copy this output number to a signature.txt file

## Congrats ! You are done ^^