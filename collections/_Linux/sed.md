---
layout: post
title: "sed"
category: commands
---

### 変換先文字列に区切り文字（ex. スラッシュ）が含まれる場合

区切り文字を変更する必要がある。

以下は動作せず、

```
TARGET="/var/tmp"
TO="/run"
echo "$TARGET" | sed -e "s/tmp/$TO/"
```

以下のエラーが出る。

```
sed: -e expression #1, char 8: `s' に対するオプションが不明です
```

これは `$TO` が展開されることを考えれば理解できる。 `"s/tmp//run/"` では sed が評価できない。

区切り文字に別の文字を使ってやればよい。 sed は s の直後の文字を区切り文字にするので、例えばコロンを使えば以下のように書ける。

```
TARGET="/var/tmp"
TO="/run"
echo "$TARGET" | sed -e "s:tmp:$TO:"
```
