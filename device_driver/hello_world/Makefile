obj-m += hello_world.o
 
ifdef ARCH
  #You can update your Beaglebone path here.
  KDIR = /home/kyuubi/work/Beagle/tmp/lib/modules/4.14.108/build
else
  KDIR = /lib/modules/$(shell uname -r)/build
endif
 
all:
	make -C $(KDIR)  M=$(shell pwd) modules
 
clean:
	make -C $(KDIR)  M=$(shell pwd) clean
