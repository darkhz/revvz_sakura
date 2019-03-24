git clone https://github.com/ChalapathiRevanth/Toolchain ~/Toolchain
export ARCH=arm64
export CROSS_COMPILE=~/Toolchain/bin/aarch64-linux-android-
export KBUILD_BUILD_USER=RevanthTolety
export KBUILD_BUILD_HOST=RevanthTolety@thunderstorm-buildserver
mkdir output
make -C $(pwd) O=output sakura_defconfig
make -j32 -C $(pwd) O=output
git clone https://github.com/Revanth/AnyKernel2 zip
cp -r output/arch/arm64/boot/Image.gz-dtb zip/
cd zip
mv Image.gz-dtb zImage 
zip -r ThunderStorm-Sakura-V2.zip *
