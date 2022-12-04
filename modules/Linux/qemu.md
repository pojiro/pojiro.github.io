---
layout: post
title: "QEMU"
categories: ["Linux"]
tags: []
---

### [ARM 環境の Raspbian イメージを x86 上の Docker で動かす](https://qiita.com/hishi/items/61652e2d9755e17630de)

リンク先でやっていることを解説すると、

- apt で `binfmt-support` と `qemu-user-static` をインストールし、異なるアーキテクチャ向けの実行ファイルを見つけたら、 `qemu(ex. qemu-arm-static)` に実行させるようにする
- ラズパイイメージに qemu-arm-static を追加した Docker イメージを作る

これにより Docker コンテナを走らせると `qemu-arm-static` がラズパイの実行ファイルを実行してくれる。

#### NOTE

`qemu-user-static` より先に `binfmt-support` をインストールしないと binfmt の対応ファイルに qemu が追加されない。対応したかどうかは update-binfmts --display で確認できる。

#### 作成した docker image

https://hub.docker.com/repository/docker/tomboworks/raspios-buster-lite-armhf-with-qemu-arm-static

refs. [QEMU のもうひとつの使い方: ユーザーモードエミュレーションと binfmt と chroot の組み合わせ](http://blog.kmckk.com/archives/2342452.html)
