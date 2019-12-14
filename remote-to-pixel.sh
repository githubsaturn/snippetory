#!/bin/sh
# Connect the phone via usb
# run adb tcpip 5555
# disconnect usb
# run adb connect IP_OF_PHONE
/home/kasra/programs/scrcpy/pixeldebug.sh
/home/kasra/programs/scrcpy/scrcpy/run /home/kasra/programs/scrcpy/scrcpy/x -m 1024 -b 4M &
echo "Connecting..."
exit

