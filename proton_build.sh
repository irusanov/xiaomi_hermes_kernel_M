#!/bin/bash

# Get kernel configuration
if [ -f proton_kernel.conf ]
  then
    source "proton_kernel.conf"
  else
    echo "Kernel configuration file (proton_kernel.conf) does not exist!"
  exit -1
fi

export PATH=$PATH:$TOOLCHAIN_PATH/bin
export CROSS_COMPILE=aarch64-linux-android-

mkdir out
cd kernel-3.10

make -C $PWD O=$PWD/../out ARCH=arm64 hermes_defconfig
make -j$(getconf _NPROCESSORS_ONLN) -C $PWD O=$PWD/../out ARCH=arm64 KCFLAGS=-mno-android
