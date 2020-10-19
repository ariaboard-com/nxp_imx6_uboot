export ARCH="arm"
export CORES=`getconf _NPROCESSORS_ONLN`
export CROSS_COMPILE="arm-linux-androideabi-"
export PATH=/opt/arm-linux-androideabi-4.9/bin:$PATH

if [ x"$1" = x"mrprober" ]; then
   rm -rf build/android-imx6d
fi

if [ ! -d build/android-imx6d ]; then
    mkdir -p build/android-imx6d
fi

make O=build/android-imx6d mx6dsabresdandroid_2x512m_defconfig
make O=build/android-imx6d -j2

rm -rf deploy/android-imx6d
mkdir -p deploy/android-imx6d
cp build/android-imx6d/u-boot-dtb.imx deploy/android-imx6d/
