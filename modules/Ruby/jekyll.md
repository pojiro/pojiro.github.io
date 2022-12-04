---
layout: post
title: "jekyll"
categories: ["Ruby"]
tags: []
---

- サイト内リンクの張り方
  - see. [Linking to pages](https://jekyllrb.com/docs/liquid/tags/#link)

### 概念整理

#### [Posts](https://jekyllrb.com/docs/posts/)

- YEAR-MONTH-DAY-title.MARKUP という名前でファイルを作る制約
- site.posts で参照可能
- site.categories は posts の categories, category をまとめたもの

#### [Pages](https://jekyllrb.com/docs/pages/)

- ルートディレクトリ直下にファイルを配置
- ルートディレクトリ直下にディレクトリを作成しファイルを配置することも可能
- site.pages で参照可能

#### [Collections](https://jekyllrb.com/docs/collections/)

- \_collection は \_config.yml で `output: true` としないと \_site ディレクトリに出力されない。
- site.collections で参照可能
- \_collections 配下のディレクトリを for で回す方法は無い
