---
layout: post
title: "Zybo Z7"
categories: ["SBC"]
tags: []
---

### Links

- [ブートプロセス](https://digilent.com/reference/programmable-logic/zybo-z7/reference-manual?redirect=1#zynq_configuration)
  - ステージ 0, 1, 2 について
- [SD ブートモード](https://digilent.com/reference/programmable-logic/zybo-z7/reference-manual?redirect=1#microsd_boot_mode)

### [Zybo Z7 Petalinux Demo](https://digilent.com/reference/programmable-logic/zybo-z7/demos/petalinux)

試した組み合わせ

- [PetaLinux Tools: 2022-1](https://japan.xilinx.com/support/download/index.html/content/xilinx/ja/downloadNav/embedded-design-tools/2022-1.html)
  - https://www.xilinx.com/member/forms/download/xef.html?filename=petalinux-v2022.1-04191534-installer.run
- [BSP: 10/Petalinux/2022.1-1](https://github.com/Digilent/Zybo-Z7/releases/tag/10/Petalinux/2022.1-1/Zybo-Z7-10-Petalinux-2022-1.bsp)
  - https://github.com/Digilent/Zybo-Z7/releases/download/10%2FPetalinux%2F2022.1-1/Zybo-Z7-10-Petalinux-2022-1.bsp

#### PetaLinux Tools のインストール

```
cd ~
mkdir -p petalinux/2022.1-04191534
chmod u+x ~/Downloads/petalinux-v2022.1-04191534-installer.run
~/Downloads/petalinux-v2022.1-04191534-installer.run --dir ~/petalinux/2022.1-04191534
```

#### Create project and Build

```
[0|]pojiro@Endeavor-Pro9050a:~/Sandbox$
source ~/petalinux/2022.1-04191534/settings.sh
[0|]pojiro@Endeavor-Pro9050a:~/Sandbox$
petalinux-create -t project -s ~/Downloads/Zybo-Z7-10-Petalinux-2022-1.bsp
INFO: Create project: 
INFO: Projects: 
INFO: 	* os
INFO: Has been successfully installed to /home/pojiro/Sandbox/
INFO: New project successfully created in /home/pojiro/Sandbox/
[0|]pojiro@Endeavor-Pro9050a:~/Sandbox$
cd os
[0|]pojiro@Endeavor-Pro9050a:~/Sandbox/os$
petalinux-build
# 時間がかかる
[0|]pojiro@Endeavor-Pro9050a:~/Sandbox/os$
ls -la images/linux/
boot.scr               rootfs.cpio.gz         rootfs.tar.gz          u-boot.bin             zynq_fsbl.elf
config                 rootfs.cpio.gz.u-boot  system.bit             u-boot.elf             
image.ub               rootfs.ext4            system.dtb             uImage                 
pxelinux.cfg/          rootfs.jffs2           u-boot-dtb.bin         vmlinux                
rootfs.cpio            rootfs.manifest        u-boot-dtb.elf         zImage
[0|]pojiro@Endeavor-Pro9050a:~/Sandbox/project/os$
petalinux-package --boot --force --fsbl images/linux/zynq_fsbl.elf --fpga images/linux/system.bit --u-boot
[0|]pojiro@Endeavor-Pro9050a:~/Sandbox/os$ # Build SSBL, BOOT.BIN
ls -la images/linux/
ls images/linux/
BOOT.BIN     image.ub        rootfs.cpio.gz.u-boot  rootfs.tar.gz   u-boot-dtb.elf  vmlinux
boot.scr     pxelinux.cfg    rootfs.ext4            system.bit      u-boot.bin      zImage
bootgen.bif  rootfs.cpio     rootfs.jffs2           system.dtb      u-boot.elf      zynq_fsbl.elf
config       rootfs.cpio.gz  rootfs.manifest        u-boot-dtb.bin  uImage
```

#### SD イメージの作成

以下を FAT32 にフォーマットした SD にコピーする

- BOOT.BIN (SSBL)
- boot.scr (U-Boot のスクリプト)
- image.ub (FIT イメージ)
  - カーネルイメージ、デバイスツリーブロブ、RAMディスクイメージなどを1つにまとめたファイル

#### ブート

※以下、未検証

ジャンパーを適切に設定（電源を wall, 起動をSD ）して、 SD をさして、電源を入れる。

PROG UART のシリアルコンソールで 115200 で起動ログが見れるはず。

リモートで動作確認してもらった際には、 PROG UART は見れず、
HDMI （TX記載側 ） に出力があり、 USB HOST となるようジャンパしてキーボード入力できるようにして root:root でログインできた。
