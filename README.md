
# Born 2 Be Root Guide

##  Synopsis

This project aims to introduce you to the wonderful world of virtualization.<br>
You will create your first machine in `VirtualBox` under specific instructions. Then at the end of this profect, you will be able to set up your own operating system while implementing strict rules.<br>
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
12. Set the size of your storage to `12.00 GB` followed by `Continue`
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
11. 

## Part 4 - Configuration of Your VM - Part 1

## Part 5 - SSH Connection

## Part 6 - Configuration of Your VM - Part 2

## Part 7 - Signature.txt
