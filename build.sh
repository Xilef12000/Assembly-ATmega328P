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
avra $asm
hex=`echo $asm | sed -e "s/.asm/.hex/g"`
sudo avrdude -p atmega328p -c arduino -P $dev -U flash:w:$hex:i

# cleanup:
echo "cleanup..."
rm *.cof
rm *.hex
rm *.obj
