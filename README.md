Driver for rtl88x2cu devices, especially COMFAST CF-812AC V2.

The kernel 6.6 module driver `rtw88_8822cu` doesn't work well with my device COMFAST CF-812AC V2. Instead I use the driver COMFAST provided.

The original codebase failed to compile on kernel 6.6.9. I added some compatible code for linux kernel > 6.0. All of the modified code referent to https://github.com/cilynx/rtl88x2bu and https://github.com/morrownr/8821cu-20210916, thanks for them!

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

> sudo bash ./install.sh

This adds a kernel module named `88x2cu`.

Don't forget to blacklist the problematic kernel module `rtw88_8822cu`:

```bash
sudo echo 'blacklist rtw88_8822cu' >> /etc/modprobe.d/88x2cu.conf
```

Reboot.

*The original codebase is downloaded from [here](http://en.comfast.com.cn/uploadfile/2023/1030/20231030025136473.zip).*
