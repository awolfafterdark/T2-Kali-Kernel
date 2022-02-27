# T2-Kali-Kernel and T2-openSUSE-Kernel

mkdir build && cd build
git clone --depth=1 https://github.com/Redecorating/mbp-16.1-linux-wifi patches
source patches/PKGBUILD

wget https://www.kernel.org/pub/linux/kernel/v${pkgver//.*}.x/linux-${pkgver}.tar.xz
tar xf $_srcname.tar.xz
cd $_srcname

git clone --depth=1 https://github.com/t2linux/apple-bce-drv drivers/staging/apple-bce
git clone --depth=1 https://github.com/t2linux/apple-ib-drv drivers/staging/apple-ibridge

for patch in ../patches/*.patch; do
    patch -Np1 < $patch
done

zcat /proc/config.gz > .config
make olddefconfig
scripts/config --module apple-ibridge
scripts/config --module apple-bce


make -j$(nproc)

