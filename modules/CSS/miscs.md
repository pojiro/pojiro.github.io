---
layout: post
title: "Miscs"
categories: ["C#"]
tags: []
---

### Media Queries

> 多くのメディア特性は範囲特性であり、 "min-" または "max-" の接頭辞をつけて「最小条件」または「最大条件」の制約を表現します。
> 例えば、この CSS はブラウザーのビューポートの幅が 12450px 以下である場合のみ、スタイルを適用します。

JavaScript ではビューポートの幅は window.innerWidth 取得できる。

```
@media (max-width: 12450px) { ... }
```

ref. https://developer.mozilla.org/en-US/docs/Web/CSS/Media_Queries/Using_media_queries#targeting_media_features
