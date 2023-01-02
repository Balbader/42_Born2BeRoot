# FTP: File Transfert Protocol

FTP (File Transfer Protocol) is used to communicate and transfer files between computers and servers / servers to computers on a TCP/IP (Transmission Control Protocol/Internet Protocol) network, aka the internet. Users, who have been granted access, can receive and transfer files in the File Transfer Protocol server (also known as FTP host/site).

### How it works

There are two distinct communication channels while establishing an FTP connection:
- The first one is called `command channel` where it initiates the instruction and response. 
- The other one is called `data channel`, where the distribution of data happens.

The goals of an FTP are:
- Allow file sharing between distants machines (computers / servers)
- independence of the file systems on server side ane client side machines
- Efficient and fast file transfert on heavy loads of files