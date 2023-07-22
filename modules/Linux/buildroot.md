---
layout: post
title: "Buildroot"
categories: ["Linux"]
tags: []
---

### Links

- [Buildroot system development training](https://bootlin.com/doc/training/buildroot/buildroot-slides.pdf)
  - Bootlin のトレーニング資料
- [組込み Linux 向けユーザランド構築ツール Buildroot 概要と使い方](https://www.nds-osk.co.jp/atc/wp-content/uploads/Buildroot.pdf)
  - 三菱電機の人が書いた 2017 年の資料

### Tips

#### qstrip

> use the make qstrip function to remove double quotes on string options

```
NODEJS_MODULES_LIST = $(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL))
```
