# setup_devices.sh
#!/bin/bash

DEVICE_ARGS=""

# ADB용 USB 전체
if [ -d /dev/bus/usb ]; then
    DEVICE_ARGS="$DEVICE_ARGS -v /dev/bus/usb:/dev/bus/usb"
fi

# 시리얼 포트 (ttyUSB, ttyACM)
for dev in /dev/ttyUSB* /dev/ttyACM*; do
    if [ -e "$dev" ]; then
        DEVICE_ARGS="$DEVICE_ARGS --device=$dev"
    fi
done

echo "$DEVICE_ARGS"