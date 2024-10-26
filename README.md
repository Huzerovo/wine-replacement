# wine replacement

## 这是什么？

在Termux proot环境下，使用Box64或者Box86，在ARM架构上运行x86指令格式的软件时，
由于Android Kernel以及Termux proot对binfmt_misc的不完全支持，
导致可能出现无法自动使用Box64/86加载这些非ARM架构的程序的情况。

## 如何使用

在Makefile中，`TARGET32`表示需要替换的32位程序。
`TARGET64`则表示64位的程序。把你想要替换的程序加入后直接执行`make`即可。

目前经验，替换`wine`、`wine64`以及`wineserver`似乎已经足够了。

## 原理

~~项目如此简陋，直接看源码都行了~~

简单来说就是：
现在我需要运行wine64，这是一个amd64指令集的软件，记作wine64-amd64。
首先，使用本项目编译出一个aarch64（有时也叫做amd64）指令集的wine64程序，
记作wine64-aarch64。利用Linux执行程序时搜索`PATH`的优先级，
使我们的wine64程序（wine64-aarch64）比被替换的wine64程序（wine64-amd64）
更早出现，从而使我们的wine程序代替了原本的wine程序。

比如，我有一个wine程序，绝对路径为`/opt/wine/bin/wine64`。
我的`PATH`为：`/usr/local/bin:/opt/wine/bin`。
那么我将编译出的wine64（wine64-aarch64）安装在`/usr/local/bin/wine64`。
就能够做到替换的效果。

该程序（wine64-aarch64）只做一件事：通过`exec`系统调用，
使用Box64执行wine64（wine-amd64）。

运行我们的wine程序（wine-aarch64）其实就相当于运行这样一条指令：`box64 wine64`。
只不过我们将其包装成了一个ELF格式的文件，而不是一个脚本文件。

## 补充

其实使用脚本文件也能实现同样的效果，但在使用`winetricks`时，
它似乎会检测文件格式，有时会导致一些奇奇怪怪的问题。
