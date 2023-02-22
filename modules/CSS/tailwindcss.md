---
layout: post
title: "tailwindcss"
categories: ["CSS"]
tags: []
---

### Links

- [tailwindcss](https://tailwindcss.com/)
- [tailwind UI](https://tailwindui.com/)
- [headless UI](https://headlessui.com/)
- [HyperUI](https://www.hyperui.dev/)

### background-image と gradient

```
bg-[linear-gradient(to_right,_white,_transparent),url('file-path')]
```

のようにも書けるが、 url() で相対パスを使う場合 CSS ファイル対する相対となる。

他の方法として mix-brend-xxx を使う方法がある。

[Tailwind Tutorial | How to Handle Background Images, Gradients, and Overlays in Tailwind CSS](https://www.youtube.com/watch?v=5UPdRF5xpVM)

### 任意値を使う

[Using arbitrary values](https://tailwindcss.com/docs/adding-custom-styles#using-arbitrary-values)

### 自動生成される HTML をいい感じにする

Official Plugin の [@tailwindcss/typography](https://tailwindcss.com/docs/typography-plugin) を使う。

### scrollbar のデザインを変更する

[Adding variants](https://tailwindcss.com/docs/plugins#adding-variants) で custom modifiers を登録して、それを使うようにする。

登録は`tailwind.config.js` に [このよう](https://github.com/pojiro/pojiro.github.io/blob/22fa123bbb541e2e77bdc62cc73ea0cdaacc1714/tailwind.config.js#L31-L35) にして、
使う際は [このよう](https://github.com/pojiro/pojiro.github.io/blob/22fa123bbb541e2e77bdc62cc73ea0cdaacc1714/_layouts/default.html#L66-L68) にする。

refs. https://github.com/tailwindlabs/tailwindcss/issues/8200#issuecomment-1109690635
