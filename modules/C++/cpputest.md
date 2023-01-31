---
layout: post
title: "CppUTest"
categories: ["C++"]
tags: []
---

### build

```
git clone https://github.com/cpputest/cpputest.git
cd cpputest
git chekcout v4.0
cd build
autoreconf .. -i
../configure
make
```

then we can get static link libraries under build/lib

```
ls lib
libCppUTest.a  libCppUTestExt.a
```
