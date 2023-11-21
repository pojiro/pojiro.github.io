---
layout: post
title: "Flutter for Embedded Linux"
categories: ["Dart", "Flutter"]
tags: []
---

> Wayland はディスプレイサーバープロトコル

ref. https://wiki.archlinux.jp/index.php/Wayland#.E3.82.B3.E3.83.B3.E3.83.9D.E3.82.B8.E3.82.BF

### コンポジタ

Wayland プロトコルを使用するディスプレイサーバ をコンポジタと呼ぶ

[flutter-elinux](https://github.com/sony/flutter-elinux) の README.md では Sway, Weston が記載されている。

### Flutter の sample プロジェクトの作り方 & 実行方法

※クライアントである Flutter を実行するので、サーバであるコンポジタを事前に tty コンソールで実効しておく必要がある点に注意

```bash
flutter-elinux create sample
cd sample
flutter-elinux run -d elinux-wayland
```

Rpi4 で動作確認した。

- Sway, version 1.5
- Weston, version 9.0

#### Nerves で実行する場合

rootfs_overlay/flutter に build をコピーして、とりあえず動作を確認する場合

1. Wayland サーバ（ Weston か Sway ）を起動する
2. Flutter を実行する

```bash
WAYLAND_DISPLAY=wayland-1 /flutter/build/elinux/arm64/debug/bundle/sample \
  --bundle=/flutter/build/elinux/arm64/debug/bundle
```

#### Build for DRM backend

Wayland を介さずに DRM に直に描画する場合は以下を参考にする

- [Installing dependent libraries](https://github.com/sony/flutter-embedded-linux/wiki/Installing-dependent-libraries)
- [Build for DRM backend](https://github.com/sony/flutter-embedded-linux/wiki/Building-Embedded-Linux-embedding-for-Flutter#build-for-drm-backend)

### ararmadillo-iot-g4 で Flutter を使う場合

see.

- https://manual.atmark-techno.com/armadillo-iot-g4/armadillo-iotg-g4_product_manual_ja-1.14.0/ch09.html
  - [画面表示を行う](https://manual.atmark-techno.com/armadillo-iot-g4/armadillo-iotg-g4_product_manual_ja-1.14.0/ch09.html#idm5521)
    - weston.ini の書き方が参考になるかも
- [Armadillo-IoT ゲートウェイ G4 コンテナ](https://armadillo.atmark-techno.com/resources/software/armadillo-iot-g4/container)
