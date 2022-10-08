---
layout: post
title:  "2022/10/08"
categories: jekyll update
---

開発ノートをできるだけ簡単に残しかつ公開する方法を模索していて、そのテストの一つとして [Github Pages](https://docs.github.com/ja/pages) を試す。

欲しいのは、

* vim でがしがし書けること
* プレビューでき、ライブリロードが効くこと
* 即時公開ができること
* 検索が効くこと
* 画像の添付が楽なこと

で後半２つ以外はぱっと試しで確認ができた。

### テスト画像の添付

![image](https://user-images.githubusercontent.com/4096956/194704644-48af6cce-96d5-4d7f-8def-0e520ee8735d.png)

### jekyll

#### install

```shell
$ asdf install ruby 2.7.2
$ asdf local ruby 2.7.2
$ gem install jekyll bundler
$ jekyll new [project_name]
$ cd project_name
$ bundle install
$ bundle exec jekyll serve --livereload
```

#### settings

マークダウンについて 

> By default, Jekyll uses the GitHub Flavored Markdown (GFM) processor for Kramdown. 

see. https://jekyllrb.com/docs/configuration/markdown/#kramdown

#### 困りごと

* 生で記述するリンクが有効にならない。これはなんとかならないかな、めんどい。
* 目次をつけたい

