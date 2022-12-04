---
layout: post
title: "tailwindcss"
category:
---

### Links

- [tailwindcss](https://tailwindcss.com/)
- [tailwind UI](https://tailwindui.com/)
- [headless UI](https://headlessui.com/)
- [HyperUI](https://www.hyperui.dev/)

### scrollbar のデザインを変更する

[Adding variants](https://tailwindcss.com/docs/plugins#adding-variants) で custom modifiers を登録して、それを使うようにする。

登録は`tailwind.config.js` に [このよう](https://github.com/pojiro/pojiro.github.io/blob/22fa123bbb541e2e77bdc62cc73ea0cdaacc1714/tailwind.config.js#L31-L35) にして、
使う際は [このよう](https://github.com/pojiro/pojiro.github.io/blob/22fa123bbb541e2e77bdc62cc73ea0cdaacc1714/_layouts/default.html#L66-L68) にする。

refs. https://github.com/tailwindlabs/tailwindcss/issues/8200#issuecomment-1109690635
