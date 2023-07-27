---
layout: post
title: "Cog"
categories: ["Linux"]
tags: []
---

https://igalia.github.io/cog/index.html

Flutter 同様、Wayland サーバをバックエンドにすることもできるし、直に DRM をバックエンドにすることもできるようだ

https://github.com/Igalia/meta-webkit/wiki/RPi#image-with-mesa-vc4-driver-drm-and-wpebackend-fdo-heavy_check_mark

### Wayland をバックエンドにする場合

https://igalia.github.io/cog/platform-wl.html

以下はデバッグ時の実行方法、ログを出力しエラーになったら終了する

```
WPEBACKEND_FDO_FORCE_SOFTWARE_RENDERING=1 \
G_MESSAGES_DEBUG=all \
MESA_DEBUG=1 \
EGL_LOG_LEVEL=debug \
LIBGL_DEBUG=verbose \
WAYLAND_DEBUG=1 \
WAYLAND_DISPLAY=wayland-1 cog \
  --webprocess-failure=exit
```

### DRM をバックエンドにする場合

調査中

- https://github.com/Igalia/meta-webkit/issues/275
