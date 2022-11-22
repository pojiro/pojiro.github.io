---
layout: post
title: "ros_cross_compile"
category:
---

### 前提条件

```
pip3 install --user vcstool
pip3 install --user ros_cross_compile
pip3 install --user colcon-ros-bundle
```

### クロスコンパイル手順

see. https://github.com/ros-tooling/cross_compile

arch は aarch64, armhf, x86_64 から選択できる

```
git clone https://github.com/ros2/ros2
mkdir -p ros_xc/ws/src
vcs import ros_xc/ws/src < ros2/ros2.repos
ros_cross_compile ros_xc/ws --arch armhf --os ubuntu --rosdistro foxy --colcon-defaults ros_xc/defaults.yaml
```

要は、 build する src を用意して、ros_cross_compile でそれらを build するだけ。

#### defaults.yaml

```
build:
  cmake-args: ["-DCMAKE_BUILD_TYPE=Release", "-DBUILD_TESTING=OFF", "-DBUILD_EXAMPLES=OFF"]
```

#### post_build.sh

https://github.com/ros-tooling/cross_compile#custom-post-build-script

以下コマンドで試したが、

```
ros_cross_compile ros_xc/ws --arch armhf --os ubuntu --rosdistro foxy --colcon-defaults ros_xc/defaults.yaml --custom-post-build-script ros_xc/post_build.sh
```

以下のエラーが出て動作しなかった。未解決。

```
INFO:Docker Client:[32.624s] ERROR:colcon.colcon_bundle.verb:Could not fetch from repositories: W:GPG error: http://packages.ros.org/ros/ubuntu focal InRelease: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY F42ED6FBAB17C654, E:The repository 'http://packages.ros.org/ros/ubuntu focal InRelease' is not signed., W:Updating from such a repository can't be done securely, and is therefore disabled by default., W:See apt-secure(8) manpage for repository creation and user configuration details., W:GPG error: http://packages.ros.org/ros2/ubuntu focal InRelease: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY F42ED6FBAB17C654, E:The repository 'http://packages.ros.org/ros2/ubuntu focal InRelease' is not signed.
INFO:Docker Client:[32.625s] ERROR:colcon:colcon bundle: Failed to fetch from repositories. Did you set your keys correctly?
```
