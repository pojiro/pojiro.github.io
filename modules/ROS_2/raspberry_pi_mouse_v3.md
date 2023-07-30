---
layout: post
title: "Raspberry Pi Mouse V3"
categories: ["ROS 2"]
tags: []
---

- https://rt-net.jp/products/raspberrypimousev3/
- https://rt-net.github.io/tutorials/raspimouse/products.html

### message types

```
$ ls -la /opt/ros/foxy/share/raspimouse_msgs/msg/*.msg
-rw-r--r-- 1 root root 40 Jul 29  2022 /opt/ros/foxy/share/raspimouse_msgs/msg/Leds.msg
-rw-r--r-- 1 root root 55 Jul 29  2022 /opt/ros/foxy/share/raspimouse_msgs/msg/LightSensors.msg
-rw-r--r-- 1 root root 39 Jul 29  2022 /opt/ros/foxy/share/raspimouse_msgs/msg/Switches.msg
```

### デバイスドライバ

- https://github.com/rt-net/RaspberryPiMouse
  - rtmouse.ko

Nerves で使うには custom_rpi4 を作って、そこで rtmouse.ko を作らせる必要がありそう。
