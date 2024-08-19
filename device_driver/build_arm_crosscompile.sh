#!/bin/bash

# Check if the path is provided
if [ -z "$1" ]; then
  echo "Usage: $0 /path/to/your/directory"
  exit 1
fi

# Change to the specified directory
cd "$1" || exit

# Run the make command
sudo make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi-

if [ "$2" = "MV" ]; then
	echo "Move .ko files to Beagle...."
	sudo rsync -avz *.ko debian@192.168.7.2:/home/debian
elif [ "$2" = "clean" ]; then
	echo "clean directory..."
	sudo make clean
else
	echo "Build .ko files..."
	exit 1
fi

shift 2
