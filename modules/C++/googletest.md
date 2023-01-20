---
layout: post
title: "GoogleTest"
categories: ["C++"]
tags: []
---

### Links

- [google/googletest](https://github.com/google/googletest)

### build

see. https://github.com/google/googletest/blob/main/googletest/README.md

```
git clone https://github.com/google/googletest.git
cd googletest
git checkout v1.13.0
mkdir build
cd build
cmake ..
make
```

then we can get static link libraries under `build/lib`

```
ls lib
libgmock.a  libgmock_main.a  libgtest.a  libgtest_main.a
```

### Use with Makefile

```
GTEST_DIR=../googletest

CFLAGS += -I$(GTEST_DIR)/googletest/include -I./include # ./include には add.h が含まれる
LDFLAGS += -L$(GTEST_DIR)/build/lib -lgtest -lpthread

run_test: build_test
	./run_test

build_test:
	g++ -o run_test test/main.cc test/add_test.cc src/add.c $(CFLAGS) $(LDFLAGS)

clean:
	$(RM) run_test

.PHONY: run_test
```

sample is here, https://github.com/pojiro/gtest_sample
