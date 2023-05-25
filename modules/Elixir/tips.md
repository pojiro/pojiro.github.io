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

### :sys.trace で message デバッグ

GenServer 内の message 処理が追える

https://medium.com/blackode/unlock-the-power-of-otp-tracing-in-elixir-level-up-your-debugging-game-92bcc144e460
