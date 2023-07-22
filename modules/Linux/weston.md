---
layout: post
title: "Weston"
categories: ["Linux", "Wayland"]
tags: []
---

```
weston
  --tty=1 \                 # tty の指定
  --no-config \             # weston.ini を使用しない
  --continue-without-input  # 入力デバイスがなくても起動する
  --debug
```

### weston.ini

- 書き方 https://man.archlinux.org/man/weston.ini.5
- /etc/xdg/weston/weston.ini が最終的にフォールバックした際に参照するパス
