#!/bin/bash

git clone https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9 -b ndk-release-r18 toolchain
git clone https://github.com/afaneh-toolchain/prebuilts_clang_host_linux-x86_clang-r383902 toolchain/clang/host/linux-x86/clang-r383902/


export CROSS_COMPILE=$(pwd)/toolchain/bin/aarch64-linux-androidkernel-
export CC=$(pwd)/toolchain/clang/host/linux-x86/clang-r383902/bin/clang
export CLANG_TRIPLE=aarch64-linux-gnu-
export ARCH=arm64
export ANDROID_MAJOR_VERSION=r

export KCFLAGS=-w
export CONFIG_SECTION_MISMATCH_WARN_ONLY=y

make -C $(pwd) O=$(pwd)/out KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y m32_defconfig
make -C $(pwd) O=$(pwd)/out KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y -j16

cp out/arch/arm64/boot/Image AIK/zImage

cd AIK
zip -r9 ../out/LMAO_kernel_m32.zip * -x *placeholder
rm -rf zImage zImage-dtb dtbo
cd ..