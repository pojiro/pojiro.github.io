---
layout: post
title: "Raspberry Pi 4 Model B"
categories: ["SBC"]
tags: []
---

### Raspberry Pi OS

#### rpi-firmware のダウングレード

https://github.com/raspberrypi/rpi-firmware のダウングレードには `rpi-update` を利用する

```
$ which rpi-update
/usr/bin/rpi-update
```

`rpi-update` の引数に `https://github.com/raspberrypi/rpi-firmware` のコミットハッシュを渡して実行することでダウングレードできる

```
$ sudo rpi-update 224cd2fe45becbb44fea386399254a1f84227218
 *** Raspberry Pi firmware updater by Hexxeh, enhanced by AndrewS and Dom
 *** Performing self-update
 *** Relaunching after update
 *** Raspberry Pi firmware updater by Hexxeh, enhanced by AndrewS and Dom
FW_REV:224cd2fe45becbb44fea386399254a1f84227218
 *** We're running for the first time
 *** Backing up files (this will take a few minutes)
 *** Backing up firmware
 *** Backing up modules 6.1.21-v8+
WANT_32BIT:0 WANT_64BIT:1 WANT_PI4:1
#############################################################
WARNING: This update bumps to rpi-5.15.y linux tree
See: https://forums.raspberrypi.com/viewtopic.php?t=322879

'rpi-update' should only be used if there is a specific
reason to do so - for example, a request by a Raspberry Pi
engineer or if you want to help the testing effort
and are comfortable with restoring if there are regressions.

DO NOT use 'rpi-update' as part of a regular update process.
##############################################################
Would you like to proceed? (y/N)
 *** Downloading specific firmware revision (this will take a few minutes)
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
  Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100  112M    0  112M    0     0  3460k      0 --:--:--  0:00:33 --:--:-- 4138k
 *** Updating firmware
 *** Updating kernel modules
 *** depmod 5.15.76-v8+
 *** Updating VideoCore libraries
 *** Using SoftFP libraries
 *** Updating SDK
 *** Running ldconfig
 *** Storing current firmware revision
 *** Deleting downloaded files
 *** Syncing changes to disk
 *** If no errors appeared, your firmware was successfully updated to 224cd2fe45becbb44fea386399254a1f84227218
 *** A reboot is needed to activate the new firmware
```

### kernel header の指定バージョンをインストールする

以下から探す

http://archive.raspberrypi.org/debian/pool/main/r/raspberrypi-firmware/
