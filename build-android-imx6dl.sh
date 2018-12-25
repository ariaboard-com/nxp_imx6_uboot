export ARCH="arm"
export CORES=`getconf _NPROCESSORS_ONLN`
export CROSS_COMPILE="arm-linux-androideabi-"
export PATH=/opt/arm-linux-androideabi-4.9/bin:$PATH
make mx6dlsabresdandroid_luna_tv_defconfig
make -j2
