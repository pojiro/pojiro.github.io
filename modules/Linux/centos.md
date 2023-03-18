---
layout: post
title: "CentOS"
categories: ["Linux", "distribution"]
tags: []
---

### CentOS 7 に Apache 2.2.34 を再構築する

レガシー環境の再現環境を作る必要があったのでメモ。

CentOS 7 をインストールした環境があるところからスタート。

まず、

```bash
yum update
sudo yum upgrade
```

して、開発ツールのインストール

```bash
yum groups list
... # リストから必要な group を確認する、今回は "開発ツール"
sudo yum groups list "開発ツール"
```

次に Apache 2.2.34 のソースコードを取得、

```bash
wget http://archive.apache.org/dist/httpd/httpd-2.2.34.tar.gz
tar xzvf 2.2.34.tar.gz
cd httpd-2.2.34
```

コンパイルする。
コンパイルとインストール方法は https://httpd.apache.org/docs/2.2/install.html

現在地を確認し、

```bash
pwd
/home/opc/httpd-2.2.34
```

手順通りにやる。

```
./configure
make
sudo make install
```

PREFIX 設定なしの場合は /usr/local/apache2 にインストールされる。

起動してみる。

```bash
sudo /usr/local/apache2/bin/apachectl start
ss -lnt
State      Recv-Q Send-Q              Local Address:Port                             Peer Address:Port
LISTEN     0      128                             *:111                                         *:*
LISTEN     0      128                             *:22                                          *:*
LISTEN     0      100                     127.0.0.1:25                                          *:*
LISTEN     0      128                          [::]:111                                      [::]:*
LISTEN     0      128                          [::]:80                                       [::]:*
LISTEN     0      128                          [::]:22                                       [::]:*
LISTEN     0      100                         [::1]:25                                       [::]:*
```

80 が開いたらとりあえずOK、外部からアクセスする。 が、 GIP:80 へ HTTP リクエストしてもレスポンスがない。

ファイアウォールは？

```bash
systemctl status firewalld.service
...
```

動作してる。設定は？

```bash
sudo firewall-cmd --list-all
...
```

SSH しか通してない、ので以下を参考に HTTP を通すようにした。

https://qiita.com/kenjjiijjii/items/1057af2dddc34022b09e

それでも通れない。クラウドの Ingress が SSH しか通してなかったので、そこも 80 を通すようにしてアクセスできるようになった。環境構築完了。
