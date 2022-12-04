---
layout: post
title: "UUID"
categories: ["Linux"]
tags: []
---

### 得る方法

```
cat /proc/sys/kernel/random/uuid
```
refs. 

- http://mitakadai.me/archives/104
- https://kazmax.zpp.jp/cmd/r/random.4.html

uuidgenコマンドがあれば、

```
uuidgen # optionが色々あるので man uuidgen を要チェック
```
