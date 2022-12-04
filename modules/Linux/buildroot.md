---
layout: post
title: "Buildroot"
category:
tags:
---

### Links

- [Buildroot system development training](https://bootlin.com/doc/training/buildroot/buildroot-slides.pdf)
  - Bootlin のトレーニング資料

### Tips

#### qstrip

> use the make qstrip function to remove double quotes on string options

```
NODEJS_MODULES_LIST = $(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL))
```
