#!/bin/sh
# rtl88x2cu dkms remove script

PACKAGE_NAME=rtl88x2cu
PACKAGE_VER=5.14.0.3

sudo modprobe -rv 88x2cu
sudo dkms remove -m $PACKAGE_NAME -v 5.14.0.3
sudo rm -rf /usr/src/rtl88x2cu-5.14.0.3

echo "The driver $PACKAGE_NAME has been uninstalled."
