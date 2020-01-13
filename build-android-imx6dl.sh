export ARCH="arm"
export CORES=`getconf _NPROCESSORS_ONLN`
export CROSS_COMPILE="arm-linux-androideabi-"
export PATH=/opt/arm-linux-androideabi-4.9/bin:$PATH

if [ x"$1" = x"mrprober" ]; then
   rm -rf build/android-imx6dl
fi

if [ ! -d build/android-imx6dl ]; then
    mkdir -p build/android-imx6dl
fi

make O=build/android-imx6dl mx6dlsabresdandroid_luna_tv_defconfig
make O=build/android-imx6dl -j2

rm -rf deploy/android-imx6dl
mkdir -p deploy/android-imx6dl
cp build/android-imx6dl/u-boot-dtb.imx deploy/android-imx6dl/
