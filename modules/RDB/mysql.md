---
layout: post
title: "My SQL"
categories: ["RDB"]
tags: []
---

### インストール後の起動確認

```
sudo systemctl status mysql.service
\u25cf mysql.service - MySQL Community Server
     Loaded: loaded (/lib/systemd/system/mysql.service; enabled; vendor preset: enabled)
     Active: active (running) since Wed 2022-12-07 08:14:32 JST; 30min ago
    Process: 1162 ExecStartPre=/usr/share/mysql/mysql-systemd-start pre (code=exited, status=0/SUCCESS)
   Main PID: 1250 (mysqld)
     Status: "Server is operational"
      Tasks: 39 (limit: 38290)
     Memory: 429.5M
     CGroup: /system.slice/mysql.service
             \u2514\u25001250 /usr/sbin/mysqld

12\u6708 07 08:14:32 Endeavor-Pro9050a systemd[1]: Starting MySQL Community Server...
12\u6708 07 08:14:32 Endeavor-Pro9050a systemd[1]: Started MySQL Community Server.
```

#### パスワードに関するログの抜粋

```
...
cat /var/log/mysql/error.log
2022-12-06T23:10:05.213531Z 6 [Warning] [MY-010453] [Server] root@localhost is created with an empty password ! Please consider switching off the --initialize-insecure option.
...
```

root user の パスワードは空。ローカルで一時的使うだけだからヨシ！

#### user 一覧を表示

```
sudo mysql -u root
mysql> select host,user from mysql.user;
```

### dump から database を import する

database と user 作った後に dump を流し込む

```
mysql -u root < backup.dump
```
