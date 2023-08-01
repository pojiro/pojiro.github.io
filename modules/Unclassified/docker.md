---
layout: post
title: "Docker"
categories: ["Unclassified"]
tags: []
---

### Links

- [Rancher Desktop](https://github.com/rancher-sandbox/rancher-desktop/)
- [Docker Desktop for Linux](https://github.com/docker/desktop-linux)

### docker attach

1. `docker ps` コマンドを実行して、アタッチしたいコンテナの ID を取得します。
2. `docker attach コンテナID` コマンドを実行してコンテナにアタッチします。

### docker detach

1. `Ctrl + p` を押し、そのまま `Ctrl + q` を押します。

これで、アタッチを解除してコンテナを停止せずに抜けることができます。
