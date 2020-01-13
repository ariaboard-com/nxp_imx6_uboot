export ARCH="arm"
export CORES=`getconf _NPROCESSORS_ONLN`
export CROSS_COMPILE="arm-linux-gnueabihf-"

#export PATH="gcc-linaro-5.3.1-2016.05-x86_64_arm-linux-gnueabihf/bin:/opt/gcc-linaro-arm-linux-gnueabihf-4.8-2013.06_linux/bin:/opt/gcc-linaro-arm-linux-gnueabihf-4.8-2013.06_linux/bin:$PATH"

if [ x"$1" = x"mrprober" ]; then
   rm -rf build/imx6d-2x512m
fi

if [ ! -d build/imx6d-2x512m ]; then
    mkdir -p build/imx6d-2x512m
fi

make O=build/imx6d-2x512m mx6dsabresd_luna_tv_defconfig
make O=build/imx6d-2x512m -j2

rm -rf deploy/imx6d-2x512m
mkdir -p deploy/imx6d-2x512m
cp build/imx6d-2x512m/u-boot-dtb.imx deploy/imx6d-2x512m/
