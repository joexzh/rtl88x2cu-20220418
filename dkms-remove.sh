#!/bin/sh
# rtl88x2cu dkms remove script

PACKAGE_NAME=rtl88x2cu
PACKAGE_VER=5.14.0.3

sudo modprobe -rv 88x2cu
sudo dkms remove -m $PACKAGE_NAME -v $PACKAGE_VER
sudo rm -rf "/usr/src/$PACKAGE_NAME-$PACKAGE_VER"

echo "The driver $PACKAGE_NAME has been uninstalled."
