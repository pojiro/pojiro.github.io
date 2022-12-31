---
layout: post
title: "Mint"
categories: ["Linux", "distribution"]
tags: []
---

### ThinkPad X1 Carbon Gen 9 の SSD 換装

手順と注意点を残す、注意点を読んで手順に従うこと

#### 手順

0. 換装前の SSD のパーティション構成を調べる
   - Mint のデフォルトインストールだと GPT で
     - 第一が fat32 で 512MiB で EFI System Partition, フラグは boot, esp が立っている
     - 第二が ext4 で残りのサイズでルートファイルシステム
1. Mint の Live USB を作成する
   - Mint は使用しているのと同バージョンにする
   - ダウンロードした ISO イメージを右クリックして「ブート可能な USB メモリの作成」をクリック
1. ノート PC の SSD を入れ換えて、Live USB で起動する
1. GParted で換装先 SSD に換装元と同じようにパーティションを構成する
1. Timeshift を起動してバックアップのある外付け HDD のスナップショットを選択し、「Restore」をクリック
1. 「Select Target Device」 で
   - "/" に対し、換装した SSD の ルートファイルシステムに利用するパーティション（ext4 等） を割り当てる
   - "/boot" と "/home" は 「Keep on Root Device」
   - "/boot/efi" は ESP のパーティション（fat32 等）を割り当てる
   - 「Bootloader Options(Advanced)」 は変更不要
1. 以降は Timeshift に従う

##### 参考

- [How To: TimeShift restore to new same size / larger HDD/SSD](https://forums.linuxmint.com/viewtopic.php?t=304585)
- [Linux mint システムバックアップ方法、TimeShift の使い方](https://timelessberry.com/column/linux/pc8linuxbackup.html)

#### 注意点

- Live USB のサイズが 4GB くらいだと Timeshift が /var/log/timeshift/ に生成するログに対し容量不足になるので 16GB くらいを使うのが良い。
  - SD カードでも Live USB として扱えるので、2022 年 12 月末の換装では 16GB の SD を利用した。
- 換装前のパーティション構成を GParted で調べておくことが重要。
  - MBR なのか GPT なのか、どのパーティションにルートファイルシステムと ESP を割り当てているかなど

以下のキャプチャは例、ただし換装後

![image](https://user-images.githubusercontent.com/4096956/210121015-ee9a2bae-79e7-494e-bb14-db71ed94bdd9.png)

### ThinkPad X1 Carbon Gen 9 へのインストール

1. https://linuxmint.com/download.php から Linux Mint 20.1 Ulyssa の Cinnamon の iso をダウンロードし、USB を作成
1. USB から Boot してインストール, Secure Boot は Enable とする
1. インストール完了後、再起動。
1. Linux Boot 前画面で表示されるメニューで Continue Boot を選ばず、Enroll MOK を行う。 ※インストール時に Secure Boot を Enable としたため。

#### グラフィクスドライバ、マイク、画面輝度キー(F5/6)が機能しない問題への対処

カーネルのドライバーが対応していないことが原因なので、カーネルを変更する。 ※変更前は 5.4, 変更後は 5.10 になる

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
