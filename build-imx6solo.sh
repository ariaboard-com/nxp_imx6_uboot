export ARCH="arm"
export CORES=`getconf _NPROCESSORS_ONLN`
export CROSS_COMPILE="arm-linux-gnueabihf-"
#export PATH="gcc-linaro-5.3.1-2016.05-x86_64_arm-linux-gnueabihf/bin:/opt/gcc-linaro-arm-linux-gnueabihf-4.8-2013.06_linux/bin:/opt/gcc-linaro-arm-linux-gnueabihf-4.8-2013.06_linux/bin:$PATH"
export PATH="/opt/gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux/bin:$PATH"

if [ x"$1" = x"mrprober" ]; then
   rm -rf build/imx6solo
fi

if [ ! -d build/imx6solo ]; then
    mkdir -p build/imx6solo
fi

make O=build/imx6solo mx6solosabresd_defconfig
make O=build/imx6solo -j2

rm -rf deploy/imx6solo
mkdir -p deploy/imx6solo
cp build/imx6solo/u-boot-dtb.imx deploy/imx6solo/

