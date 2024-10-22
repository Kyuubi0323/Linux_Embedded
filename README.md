# Linux_Embedded
Set up Beagle Board, SD card to flashing image into board. From your virtual machine, install image for BBB 
1. Install image (4.14.108)
```
wget https://files.beagle.cc/file/beagleboard-public-2021/images/bone-debian-9.12-imgtec-armhf-2020-04-06-4gb.img.xz
```
2. Extract the firmware
```
unxz bone-debian-9.12-imgtec-armhf-2020-04-06-4gb.img.xz
```
3. Write into SD card
```
sudo mkdir /media/usb
sudo dd if=/bone-debian-9.12-imgtec-armhf-2020-04-06-4gb.img of=/dev/sdb
sync
```
After that, u can config usb port to connect internet without using Ethernet port. Control your board by the computer with Serial connection (rcm using CP2102 TTL series).<br>
4. Config Network for USB port (https://www.digikey.com/en/maker/blogs/how-to-connect-a-beaglebone-black-to-the-internet-using-usb)
```
sudo /sbin/route add default gw 192.168.7.1
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
```
