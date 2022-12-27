
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
- [Part 7 - Signature.txt](#Part-7---Signature.txt)

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

1.  Go to the official Debian website and download the following `.iso` file: [https://www.debian.org/download](https://www.debian.org/download)

### Part 1.1 - Setting Up Your Environment
> For 42 Machines

1. CD into your sgoinfre folder<br>
	`cd sgoinfre`

2. Create a folder named after you student intra login followed by the number 42<br>
	`mkdir <your intra login42>`

 3. Change authorization on the directory you just created
	 `chmod 777 <your intra login42`

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

12. Then select the `SCSI1 (0,0,0) (sda)` option
13. Select `Yes` for the `Create new empty partition table on this device?` section
14. Select the `pri/log` line
15. Select `Create a new partition` for the `How to use this free space` section
16. For the `New partition size` enter `500M` then click `Continue`
17. For the type select `Primary` and `Beginning` as its Location
18. In the `Partition settings` select the `Mount point: /` option
19. Then select the `/boot` option , in the `erase data` section select `no` this will allow to minimize the size of the `.vdi` file and therefore, shorten the generation time of the `signature.txt` file.
20. Then, select `Done setting up the partition` to finish the partitioning process of the first disk

### 3.2 - Logical Volume

21. Select the `pri/log` linehen 
22. Select `Create a new partition` for the `How to use this free space` section
23. For the `New partition size` enter `max` then click `Continue`
24. For the type select `Logical`
25. In the `Partition settings` select the `Mount point: /` option
26. Then select the `Do not mount it` option
27. Then, select `Done setting up the partition` to finish the partitioning process of the first disk

### 3.3 - Configure encrypted volumes

28. Select `Configure  encrypted volumes` in the Partition Disks main menu
29. Select `Yes` to the `Write the changes to disk and configure encrypted volumes?`
30. Select `Create encypted volumes`
31. In the `Devices to encrypt` window, use your spacbar to select `/dev/sda5` followd by `Continue`
32. On the `Partition settings` select `Done setting up the partition`
33. Then select `Finish`
34. Then select `Yes` to `Really erase the data on SCSI! (0,0,0), partition #5 (sda)?`
35. Enter a password and confirm the password

### 3.4 - Configure the Logical Volume Manager

36.  In the Partition Disks main menu, select the `Configure the Logical Volume Manager` option
37. Then select `Yes` to `Write the changes to disk and configure LVM`
38. In the `LVM configuration action` select the `Create volume group` option
39. Give it `LVMGroup` as a name
40. Unsing your spacebar, select the `/dev/mapper/sda5_crypt` option
41. Select `Create logical volume` option and select the `LVMGroup` as the location where it should be created
42. Name it as `root`
43. and give it a total space of `10G`
44. Select `Create logical volume` option and select the `LVMGroup` as the location where it should be created
45. Name it as `swap`
46. and give it a total space of `2.3G`
47. Select `Create logical volume` option and select the `LVMGroup` as the location where it should be created
48. Name it as `home`
49. and give it a total space of `5G`
50. Select `Create logical volume` option and select the `LVMGroup` as the location where it should be created
51. Name it as `var`
	1. and give it a total space of `3G`
52. Select `Create logical volume` option and select the `LVMGroup` as the location where it should be created
53. Name it as `srv`
54. and give it a total space of `3G`
55. Select `Create logical volume` option and select the `LVMGroup` as the location where it should be created
56. Name it as `tmp`
57. and give it a total space of `3G`
58. Select `Create logical volume` option and select the `LVMGroup` as the location where it should be created
59. Name it as `var-log`
60. and give it a total space of `4G`
61. Then select `Finish`

### 3.5 - Mounting your LVM's

62. Select `#1` under the `LV home` line
63. In the `Partition settings` select the `Use as: do not use` option`
64. In the `How to use this partition` menu, select the `Ext4 journaling file system` option
65. Then select `Mount point` option and select the `/home` directory
66. Then select `Done setting up the partition`

Repeat steps 65 through 69 for all your `LVM` but make sure to select the correct `Mount point` directory for each of them.

> NOTE: <br>
> Make sure to select `swap area` for the `use as:` option<br>
> For the `var--log` LVM, select `Ext4 journaling file system` and <br>as its `Mount point option` select `enter manually` and enter: `/var/log`

### 3.6 - Finishing the Patitioning process

67. Select `Finish partitioning and write changes to disks`
68. Select `Yes` to `Write the changes to disks?`
69. Select `No` for `Scanextra installation media ?`
70. Select your country
71. Select `deb.debian.org` in the Debian archive mirror menu
72. Leave the `proxy information` blanc
73. Select `No` for `participating in the survey`
74. In the `Choose software to install` , make sure to unselect `SSH server` and `Standard system utilities` then click `Continue`
75. Select `Yes` for `Install the GRUB boot loader to your primary drive ?`
76. Select the `/dev/sda` option and click `Continue`
77. Select `Continue` for `Installation complete`
78. Once you VM has restarted, and you are in `/home/hostname` directory, type `lsblk` and compare your partitions with the ones in the bonus part of the subject.

## Part 4 - Configuration of Your VM - Part 1

### 4.1 - Installing `sudo`

1. In order to install `sudo` you need to be loged as root user. To switch to `root` type:
		`su -` and enter your password when requested.
2. Once in root mode:
		`apt update -y`
		`apt upgrade -y`
		`apt install sudo`
3. Verify that `sudo` was properly installed:
		`dpkg -l | grep sudo`

To check:
-  apt vs apt-get vs aptitude
-  sudo
-  giving root privileges to user

### 4.2 - Add user to `sudo` group
1. Add User: `usermod -a -G sudo <user_name>`
2. Verify user has been added to group: `getent group sudo`
3.  Open `sudoers` file and give `root` privileges to the added user
		`sudo visudo`
4. Search for the `# User privilege specification` and add 
`your <user_name> ALL=(ALL) ALL` 
5. exit sudo mode by typing `exit`


### 4.3 - Installing git and vim

1. Install git: `sudo apt install git -y`
2. Check git version: `git --version`
3. Install vim: `sudo apt install vim -y`
4. Check vim version: `vim --version`

### 4.4 - Install and configure SSH (Secure Shell Host)

1. Install SSH: `sudo apt install openssh-server -y`
2. Check SSH status: `sudo systemctl ssh status`
3. Edit sshd config file to change Port: `sudo vim /etc/ssh/sshd_config`
4. Replace `#Port 22` with `Port 4242`
5. Finally, verify that the Port change was done: `sudo grep Port /etc/ssh/sshd_config`
6. Restart SSH: `sudo service ssh restart`

- To Check:
-  `openssh-server`
- `systemctl`
- `service`

### 4.5 - Install and configure UFW (Uncomplicated FireWall)

1. Install UFW: `sudo apt install ufw -y`
2. Enable UFW on your system: `sudo ufw enable`
3. Check UFW status: `sudo ufw status`
4. Allow SSH protocol : `sudo ufw allow ssh`
5. Allow 4242 protocol: `sudo ufw allow 4242`
6. Check UFW status and list UFW rules: `sudo ufw status numbered`

- To Check:
- `UFW`

## Part 5 - SSH Connection (Secure Shell Host)

1. Turn off your VM
2. Open your VM settings
3. Select the `Network` option
4. Select `Adapter 1`
5. Select `Abanced`
6. Select `Port Forwarding`
7. If no rule is visible click the green `+` button
8. Add `4242` as a `Host Port` and as a `Guest Port`
9. Click `OK`
10. Start your VM
11. Check your SSH status: `sudo systemctl ssh status`
12. Open your inhouse terminal
13. Connect to your VM via `ssh`: `ssh your_username@127.0.0.1 -p 4242`
14. Enter your password when requested
15. At this point you should be connected to you VM

> NOTE:
> At this point, if you connected successfully to your VM, you should be able to continue the following steps directly on your inhouse terminal as long as you are connected to your VM.

## Part 6 - Configuration of Your VM - Part 2

### 6.1 - Setting Strong Password Policy

1. Install the `pam-pwquality` library: `sudo apt install libpam-pwquality -y`
2. Edit the `common-password` file : `sudo vim /etc/pam.d/common-password`
3. Find the line: `password    requisite    pam_deny.so retry=3`
4. At the end of this line, after `retry=3` add the following:<br>
		`minlen=10 ucredit=-1 dcredit=-1 maxrepeat=3 refect_username difok=7 enforce_for_root`

- To Check:
- `pam-quality`
-  `minlen=10 ucredit=-1 dcredit=-1 maxrepeat=3 refect_username difok=7 enforce_for_root`
## Part 7 - Signature.txt
