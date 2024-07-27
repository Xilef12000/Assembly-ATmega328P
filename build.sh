#!/bin/sh

# please run script from dir in which the .asm file resides.
# i.e.:
# ~/Assembly-ATmega328P/00_LED$ ../build.sh
# the optional parameters are:
# 	with no parameter: use .asm file named the same way as dir:
# 		$ build.sh
# 	specify file to use:
# 		$ build.sh example.asm
# 	specify file + which device to upload to:
# 		$ build.sh example.asm /dev/ttyACM1

asm=${PWD##*/}.asm
if [ "$1" ]
then
	asm=$1
fi
dev="/dev/ttyACM0"
if [ "$2" ]
then
	dev=$2
fi
echo "\e[1;35mcompiling... \e[0m"
avra $asm
if [ $? != 0 ]
then
	echo "\e[1;31mAborted! \e[0m"
	exit
fi
hex=`echo $asm | sed -e "s/.asm/.hex/g"`
echo "\e[1;35muploading... \e[0m"
sudo avrdude -p atmega328p -c arduino -P $dev -U flash:w:$hex:i
if [ $? != 0 ]
then
	echo "\e[1;31mAborted! \e[0m"
	exit
fi
# cleanup:
echo "\e[1;35mcleaning... \e[0m"
rm *.cof
rm *.hex
rm *.obj
echo "\e[1;32mFinished \e[0m"