export ARCH="arm"
export CORES=`getconf _NPROCESSORS_ONLN`
export CROSS_COMPILE="arm-linux-gnueabihf-"
#export PATH="gcc-linaro-5.3.1-2016.05-x86_64_arm-linux-gnueabihf/bin:/opt/gcc-linaro-arm-linux-gnueabihf-4.8-2013.06_linux/bin:/opt/gcc-linaro-arm-linux-gnueabihf-4.8-2013.06_linux/bin:$PATH"

if [ x"$1" = x"mrprober" ]; then
   rm -rf build/imx6q
fi

if [ ! -d build/imx6q ]; then
    mkdir -p build/imx6q
fi

make O=build/imx6q mx6qsabresd_defconfig
make O=build/imx6q -j2

rm -rf deploy/imx6q
mkdir -p deploy/imx6q
cp build/imx6q/u-boot-dtb.imx deploy/imx6q/
