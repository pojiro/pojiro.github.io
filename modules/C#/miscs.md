---
layout: post
title: "Miscs"
categories: ["C#"]
tags: []
---

### 演算子

- 単項の接尾辞 ! 演算子は [null-forgiving 演算子](https://learn.microsoft.com/ja-jp/dotnet/csharp/language-reference/operators/null-forgiving)
- ?. は [null 条件演算子](https://learn.microsoft.com/ja-jp/dotnet/csharp/language-reference/operators/member-access-operators#null-conditional-operators--and-)

### 修飾子

- private な関数に static を付ける意味はあるのか？
  - [Advantages to Using Private Static Methods](https://stackoverflow.com/questions/135020/advantages-to-using-private-static-methods)
    - [CA1822: Mark members as static](https://learn.microsoft.com/en-us/dotnet/fundamentals/code-analysis/quality-rules/ca1822)

### テスト

- [ReactiveTest usage to mock an observable](https://stackoverflow.com/questions/48660518/reactivetest-usage-to-mock-an-observable)
  - 未検証、でもこれやりたいやつな気がする

### デザインパターン

- [C#で Observer パターンをきちんと理解して実装する](https://qiita.com/yutorisan/items/6e960426da71b7e02af7)

### Reactive Extensions

- https://learn.microsoft.com/ja-jp/previous-versions/dotnet/reactive-extensions/hh242985(v=vs.103)
- [Rx Workshop](https://learn.microsoft.com/en-us/shows/rx-workshop/)

### LINQ

- [Head- and Tail-like methods in C#](https://www.tabsoverspaces.com/233633-head-and-tail-like-methods-on-list-in-csharp-and-fsharp-and-python-and-haskell)

### SerialPort

- [public void Write (string text)](<https://learn.microsoft.com/en-us/dotnet/api/system.io.ports.serialport.write?view=dotnet-plat-ext-7.0#system-io-ports-serialport-write(system-string)>) は、デフォルトでは string （UTF16 の羅列）を ASCII エンコードして 0x7F までの byte 配列している。 see. リンク先の Remarks を読むこと
