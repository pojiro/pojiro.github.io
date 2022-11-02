---
layout: post
title: "mix_tombo_watch"
category: library
tags: Elixir
---

### 要求

[mix test.watch](https://github.com/lpil/mix-test.watch) が最高なので、 Elixir 以外でも使いたい。

### 要件

- [mix archive.install](https://hexdocs.pm/mix/Mix.Tasks.Archive.Install.html) でインストールして使えること
  - これにより mix プロジェクト外で使える
- ファイル操作を検知できること
  - 検知対象の include, exclude ができること
- ファイル操作検知をトリガーにコマンドを単発実行できること

### CLI

```
$ mix tombo.watch --command make test --config config.exs
$ mix tombo.watch --command make test
$ mix tombo.watch make test
```

### 調査

mix test.watch がどのようにその機能を実装しているか調査する。

- ファイル操作の検知は [FileSystem](https://github.com/falood/file_system) を使っている。


### ドッグフーディング

`make` コマンドの実行をファイル保存をトリガにやりたいプロジェクトがいくつかある

- [Tombo Notes](https://github.com/pojiro/pojiro.github.io)
