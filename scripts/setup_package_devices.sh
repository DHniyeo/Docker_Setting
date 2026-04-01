#!/bin/bash
# scripts/setup_packages.sh

apt update && apt install -y \
    adb \
    tio \
    minicom \
    usbutils \
    && apt clean && rm -rf /var/lib/apt/lists/*