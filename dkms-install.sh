#!/bin/sh
# rtl88x2cu dkms install script

PACKAGE_NAME=rtl88x2cu
PACKAGE_VER=5.14.0.3
MODULE_NAME=88x2cu
WRONG_MODULE=rtw88_8822cu
SCRIPT_PATH="$(dirname "$0")"

echo "try to un-probe kernel mods: $WRONG_MODULE $MODULE_NAME"
sudo modprobe -r $WRONG_MODULE
sudo modprobe -r $MODULE_NAME

sudo dkms add "$SCRIPT_PATH" || exit 1
sudo dkms install -m $PACKAGE_NAME -v $PACKAGE_VER || exit 1

CONFIG_FILE=/etc/modprobe.d/$MODULE_NAME.conf

sudo cp -v --backup "$SCRIPT_PATH/$MODULE_NAME.conf" $CONFIG_FILE || exit 1
sudo editor "$CONFIG_FILE"

sudo modprobe -v $MODULE_NAME

echo "The driver (package name: $PACKAGE_NAME, module name: $MODULE_NAME) has been installed."
