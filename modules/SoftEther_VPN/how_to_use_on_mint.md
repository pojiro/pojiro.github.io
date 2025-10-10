---
layout: post
title: "how_to_use_on_mint"
categories: ["SoftEther VPN"]
tags: []
---

### インストールの確認

```
$ which vpnclient
/usr/bin/vpnclient
```

### 開始

```
$ sudo vpnclient start
# SoftEther VPN Client Manager を wine で実行する
# SoftEther VPN Client Manager で `Ner Virtual Network Adapter` で VPN を作る
# これにより vpn_vpn ができるので、IP を与える
$ sudo ip addr add 192.168.0.100/24 dev vpn_vpn
# SoftEther VPN Client Manager で `Import VPN Connection Setting` で設定をインポートする
# 設定を使って `Connect` する
```

### 終了

```
$ sudo vpnclinet stop
```
