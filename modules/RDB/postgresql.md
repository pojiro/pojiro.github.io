---
layout: post
title: "PostgreSQL"
categories: ["RDB"]
tags: []
---

### Peer authentication failed

Unix ユーザ pojiro で以下のコマンドを実行すると

```
psql -U postgres -W
psql: error: FATAL:  Peer authentication failed for user "postgres"
```

となり失敗する。この原因は書いてあるとおりで `Peer authentication failed` ということらしい。

Peer Authentication とは https://www.postgresql.org/docs/12/auth-peer.html

`-W` をつけているがパスワード認証にはなっておらず Peer 認証になっている。
Peer 認証となっているのは `/etc/postgresql/12/main/pg_hba.conf` が以下（抜粋）のように設定されているため。

```
# Database administrative login by Unix domain socket
local   all             postgres                                peer
```

パスワード認証にするには https://www.postgresql.org/docs/12/auth-password.html

例えば md5 を選び、リロードすれば良い。

```
# Database administrative login by Unix domain socket
local   all             postgres                                md5
```

```
sudo systemctl reload postgresql.service
```
