---
layout: post
title: "PostgreSQL"
categories: ["RDB"]
tags: []
---

### dump して restore

ダンプ

```
pg_dump --host=localhost --port=5432 --username=postgres --dbname=db_name --format=c --file=file.dump
```

別サーバの postgresql の postgres ユーザにパスワード設定

```
sudo su - postgres # local postgres の場合
psql
ALTER ROLE postgres WITH PASSWORD 'password';
\q
```

DB 作成

```
mix ecto.create # phoenix の場合
```

リストア

```
sudo su -u postgres # local postgres の場合
pg_restore --db_name=db_name --no-owner /path/to/file.dump
```

### トランザクション分離レベル

```
pojiro=> show transaction_isolation;
 transaction_isolation
-----------------------
 read committed
(1 row)
```

```
SET TRANSACTION ISOLATION LEVEL { SERIALIZABLE | REPEATABLE READ | READ COMMITTED | READ UNCOMMITTED }
```

see. https://www.postgresql.org/docs/12/sql-set-transaction.html

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

### psql: error: FATAL: database "pojiro" does not exist

`create user pojiro;` し、 `psql` でアクセスすると発生する。

文字通り database "pojiro" が存在しないことが原因。
これはどういうことかと言うとユーザは必ず何らかの database に接続してログインしているということ。

例えば、`psql -U postgres` で database 指定なしでログインすると `postgres` という名前の database に接続している。

```
postgres=# \l
                                         List of databases
          Name           |  Owner   | Encoding |   Collate   |    Ctype    |   Access privileges
-------------------------+----------+----------+-------------+-------------+-----------------------
 ...
 postgres                | postgres | UTF8     | ja_JP.UTF-8 | ja_JP.UTF-8 |
 ...
postgres=# \dt
Did not find any relations.
postgres=# \c test;
You are now connected to database "test" as user "postgres".
test=#
```

`=#` の左側が接続している database ということだ。

> 文字通り database "pojiro" が存在しないことが原因。

なので、`create database pojiro` としてデフォルト接続先を用意してやればよい。
user に `Create DB` の権限があれば、そこで create database して database を切り替えられる。
