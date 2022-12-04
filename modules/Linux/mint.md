---
layout: post
title: "Mint"
categories: ["Linux", "distribution"]
tags: []
---

### ThinkPad X1 Carbon Gen 9 へのインストール

1. https://linuxmint.com/download.php から Linux Mint 20.1 Ulyssa の Cinnamon の iso をダウンロードし、USBを作成
1. USBからBootしてインストール, Secure Boot は Enable とする
1. インストール完了後、再起動。
1. Linux Boot前画面で表示されるメニューでContinue Bootを選ばず、Enroll MOKを行う。 ※インストール時に Secure Boot を Enable としたため。

#### グラフィクスドライバ、マイク、画面輝度キー(F5/6)が機能しない問題への対処

カーネルのドライバーが対応していないことが原因なので、カーネルを変更する。 ※変更前は5.4, 変更後は5.10になる

```
sudo apt install linux-oem-20.04b
```

refs.

- https://askubuntu.com/questions/1299067/ubuntu-20-04-no-driver-loaded-for-intel-iris-xe-graphics
- https://wiki.ubuntu.com/Kernel/OEMKernel

```
apt show linux-oem-20.04b
Package: linux-oem-20.04b
Version: 5.10.0.1023.24
Priority: optional
Section: kernel
Source: linux-meta-oem-5.10
Origin: Ubuntu
Maintainer: Ubuntu Kernel Team <kernel-team@lists.ubuntu.com>
Bugs: https://bugs.launchpad.net/ubuntu/+filebug
Installed-Size: 9,216 B
Provides: kernel-testing--linux-oem-5.10--full--oem, kernel-testing--linux-oem-5.10--full--preferred
Depends: linux-image-oem-20.04b (= 5.10.0.1023.24), linux-headers-oem-20.04b (= 5.10.0.1023.24)
Download-Size: 1,912 B
APT-Manual-Installed: yes
APT-Sources: http://ubuntu-ashisuto.ubuntulinux.jp/ubuntu focal-updates/main amd64 Packages
Description: Complete OEM Linux kernel and headers
 This package will always depend on the latest complete OEM Linux kernel
 and headers.
```
