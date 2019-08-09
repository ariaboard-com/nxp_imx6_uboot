export ARCH="arm"
export CORES=`getconf _NPROCESSORS_ONLN`
export CROSS_COMPILE="arm-linux-gnueabihf-"
#export PATH="gcc-linaro-5.3.1-2016.05-x86_64_arm-linux-gnueabihf/bin:/opt/gcc-linaro-arm-linux-gnueabihf-4.8-2013.06_linux/bin:/opt/gcc-linaro-arm-linux-gnueabihf-4.8-2013.06_linux/bin:$PATH"
export PATH="/opt/gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux/bin:$PATH"
make mx6solosabresd_defconfig
make -j2
