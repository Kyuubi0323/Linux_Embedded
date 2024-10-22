**Todo Steps for Cross-Compiling**
1. Set up Host ubuntu 
Install some package that needed to build the Linux Kernel<br>
```
sudo apt-get install build-essential gcc-arm-linux-gnueabi git lzop u-boot-tools bison flex libssl-dev libncurses-dev sshfs lzma gettext libmpc-dev libncurses5-dev:amd64
```
then create a new directory called Beagle
```
mkdir ~/Beagle
cd ~/Beagle
```
after that, clone the linux kernel from Github then checkout to the exact version of your BBB (my settings is 4.14.108-ti-r131. U can check it by command "uname -ar" in your board)
```
git clone git://github.com/beagleboard/linux.git
cd linux/
git checkout 4.14.108-ti-r131
```
2. Build the folder
```
make -j4 ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- bb.org_defconfig
```
then run menuconfig
```
make -j4 ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- menuconfig
```
Now build the linux kern using the below commands, it will take time (abt 30mins)
```
make -j4 ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- LOADADDR=0x80000000 uImage dtbs
```
then the modules
```
make -j4 ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- modules
```
Finale, we will create a temp dir that resides outside of our linux kern dir. And we will install the modules into that temp dir.
```
mkdir ../tmp/
make -j4 ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- INSTALL_MOD_STRIP=1 INSTALL_MOD_PATH=../tmp modules_install
```
**Using the script to transfer files to board** <br>
I create ./build_arm_crosscompile.sh to help the build process faster. It has some feat that u guys can try or just modify when fork down.<br>
It can be called with 2 params passed in.
```
./build_arm_crosscompile.sh <path_to_dir> <CMD>
```
about CMD <br>
>if "MV" it will automate generate the .ko file then transfer it to the board /home/debian: <br>
>if "clean" just a norm cmd that clean all the output 've just built <br>
>if "" it will only generate the .ko files <br>
