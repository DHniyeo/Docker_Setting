# scripts/setup_packages.sh
#!/bin/bash

apt update && apt install -y \
    adb \
    tio \
    minicom \
    usbutils \
    && apt clean && rm -rf /var/lib/apt/lists/*