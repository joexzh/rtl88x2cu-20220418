Driver for rtl88x2cu devices, especially COMFAST CF-812AC V2.

The kernel 6.6 module driver `rtw88_8822cu` doesn't work well with my device COMFAST CF-812AC V2. Instead I use the driver COMFAST provided.

The original codebase failed to compile on kernel 6.6.9. I added some compatible code for linux kernel > 6.0. All of the modified code refer to https://github.com/cilynx/rtl88x2bu and https://github.com/morrownr/8821cu-20210916, thanks for them!

## tested device:

- COMFAST CF-812AC V2

![img](https://i.ibb.co/HPLhGny/COMFAST-CF-812-AC-V2.jpg)

lsusb:

```console
Bus 003 Device 002: ID 0bda:c812 Realtek Semiconductor Corp. 802.11ac NIC
```

## tested OS:

- Linux debian unstable 6.6.9-amd64

## install

### dkms

```bash
./dkms-install.sh
```
An editor will be prompted for `/etc/modprobe.d/88x2cu.conf` before finishing the installation, you can just close it if don't need to modify any settings.

### without dkms

```bash
sudo bash ./install.sh
```

This adds a kernel module named `88x2cu` to `/lib/modules/YOUR_KERNEL_VER/kernel/drivers/net/wireless/88x2cu.ko`

Don't forget to blacklist the original kernel module `rtw88_8822cu`:

```bash
sudo echo 'blacklist rtw88_8822cu' >> /etc/modprobe.d/88x2cu.conf
```

Reboot.

## uninstall

### dkms

```bash
./dkms-remove.sh
```

### without dkms

```bash
sudo modprobe -r 88x2cu

sudo make uninstall
```

*The original codebase is downloaded from [here](http://en.comfast.com.cn/uploadfile/2023/1030/20231030025136473.zip).*
