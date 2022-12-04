---
layout: post
title: "Mox"
categories: ["Elixir"]
tags: []
---

https://github.com/dashbitco/mox

### 読むべき記事

#### [Mocks and explicit contracts](https://dashbit.co/blog/mocks-and-explicit-contracts)

モックに対する問題意識や思想を Jose が書いた記事

#### [Elixir Test Mocking with Mox](https://medium.com/flatiron-labs/elixir-test-mocking-with-mox-b825a955143f)

GitHub API Client の作成のために、モックサーバーつまり GitHub API のシミュレータを作ったことによるデメリットを紹介しそれを Mox を使って改善する話が書いてある。

デメリットは

- テストを書く際にモックサーバーのリターンを調べなければいけないこと
- テストがモックサーバーに依存すること
- explicit contract を Client に定義しなくてよくなってしまうこと

が挙げられている。 Mox を使うことで

- クライアントのモックを作成する
- ビヘイビアの定義の強制により explicit contract を定義できるようになる
- 使用するライブラリを抽象化し、設計を改善する

点を紹介している。
