sudo apt update # update the system
sudo apt upgrade # upgrade the system
sudo apt install -y git vim make gcc libncurses-dev flex bison bc \cpio libelf-dev libssl-dev syslinux dosfstools qemu-system-x86 # install the library
git clone --depth 1 https://github.com/torvalds/linux.git # downloads only the latest revision of the Linux kernel to save time and space.
cd linux # change directory to linux 
make menuconfig # opens a terminal-based graphical interface to customize Linux kernel features and drivers before compiling.
make -j 2 # starts the compilation process using 2 CPU cores in parallel to speed up the build.