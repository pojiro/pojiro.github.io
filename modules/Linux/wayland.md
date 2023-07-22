---
layout: post
title: "Wayland"
categories: ["Linux", "Wayland"]
tags: []
---

Wayland はディスプレイサーバとクライアント間の通信プロトコル

### Wayland プロトコルをしゃべるサーバ

Linux Kernel の DRM/KMS に描画をさせるディスプレイサーバ

- クライアントにとってのバックエンド
- サーバ自身はコンポジタと呼ばれる
- サーバにとってのバックエンドは DRM/KMS 、  
  が、コンポジタ上でコンポジタを実行できるので Wayland サーバのバックエンドが Wayland サーバになることもある
  - Weston 上で Sway が実行できる

#### コンポジタ

- [Weston](https://gitlab.freedesktop.org/wayland/weston)
- [Sway](https://github.com/swaywm/sway)

### Wayland プロトコルをしゃべるクライアント

Weston や Sway に対して描画をさせるソフトウェア

- [flutter-embedded-linux](https://github.com/sony/flutter-embedded-linux)
   - Wayland プロトコルを介さずに DRM に直に描画させることもできる
- [cog](https://github.com/Igalia/cog)
