---
layout: post
title: "Tips"
categories: ["Elixir", "other"]
tags: []
---

### ドキュメントをさっと開く

```
mix hex.docs PACKAGE [VERSION]
```

see more details `mix help hex.docs`

### リストの結合

```
[elem | list]
list ++ list
Enum.concat(list, list)
```

### case 内で in を使う

```
case condition do
  val when val in [false, nil] -> else_clause
  _ -> do_clause
end
```

refs. プログラミング Elixir p. 244
