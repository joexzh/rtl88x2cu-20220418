#!/bin/sh
# rtl88x2cu dkms remove script

PACKAGE_NAME=rtl88x2cu

sudo modprobe -rv 88x2cu
sudo dkms remove -m $PACKAGE_NAME -v 5.14.0.3 || exit 1

echo "The driver $PACKAGE_NAME has been uninstalled."
