sudo apt update -y
sudo apt full-upgrade -y
sudo apt install -y ack antlr3 asciidoc autoconf automake autopoint binutils bison build-essential bzip2 ccache cmake cpio curl device-tree-compiler fastjar flex gawk gettext gcc-multilib g++-multilib git gperf haveged help2man intltool libc6-dev-i386 libelf-dev libglib2.0-dev libgmp3-dev libltdl-dev libmpc-dev libmpfr-dev libncurses5-dev libncursesw5-dev libreadline-dev libssl-dev libtool lrzsz mkisofs msmtp nano ninja-build p7zip p7zip-full patch pkgconf python2.7 python3 python3-pip qemu-utils rsync scons squashfs-tools subversion swig texinfo uglifyjs upx-ucl unzip vim wget xmlto xxd zlib1g-dev
git clone https://github.com/coolsnowwolf/lede
cd lede
./scripts/feeds update -a
./scripts/feeds install -a
echo 'CONFIG_TARGET_mediatek=y' >>.config
echo 'CONFIG_TARGET_mediatek_mt7622=y' >>.config
echo 'CONFIG_TARGET_mediatek_mt7622_DEVICE_xiaomi_redmi-router-ax6s=y' >>.config
make defconfig
make download -j8
echo -e "$(nproc) thread compile"
make -j$(nproc) || make -j1 || make -j1 V=s
