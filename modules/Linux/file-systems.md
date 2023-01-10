---
layout: post
title: "filesystems"
categories: ["Linux"]
tags: []
---

### Links

- [configfs](https://www.kernel.org/doc/Documentation/filesystems/configfs/configfs.txt)
- [ext4](https://www.kernel.org/doc/Documentation/filesystems/ext4/ext4.rst)
  - [Ext4 Disk Layout](https://ext4.wiki.kernel.org/index.php/Ext4_Disk_Layout)

### ext4

- direct block の数, 12
- indirect block の数, 1
- double indirect block の数, 1
- triple indirect block の数, 1

refs. [linux/fs/ext4.h](https://github.com/torvalds/linux/blob/master/fs/ext4/ext4.h)

```
/*
 * Constants relative to the data blocks
 */
#define	EXT4_NDIR_BLOCKS		12
#define	EXT4_IND_BLOCK			EXT4_NDIR_BLOCKS
#define	EXT4_DIND_BLOCK			(EXT4_IND_BLOCK + 1)
#define	EXT4_TIND_BLOCK			(EXT4_DIND_BLOCK + 1)
#define	EXT4_N_BLOCKS			(EXT4_TIND_BLOCK + 1)
```

#### super block の調べ方

nvme0 の コントローラ 1 の パーティション 2 （ext4 ）を調べる例

```
$ sudo dumpe2fs -h /dev/nvme0n1p2
```
