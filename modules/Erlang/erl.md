---
layout: post
title: "erl"
categories: ["Erlang"]
tags: []
---

### shell

```
erl
Erlang/OTP 24 [erts-12.2.1] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [jit]

Eshell V12.2.1  (abort with ^G)
1>
```

Ctrl + G で `User switch command` が表示される

```
User switch command
 -->
```

`h` か `?` で

```
User switch command
 --> h
  c [nn]            - connect to job
  i [nn]            - interrupt job
  k [nn]            - kill job
  j                 - list all jobs
  s [shell]         - start local shell
  r [node [shell]]  - start remote shell
  q                 - quit erlang
  ? | h             - this message
```

が表示されるので、表示にしたがっていろいろ試すとよい。
