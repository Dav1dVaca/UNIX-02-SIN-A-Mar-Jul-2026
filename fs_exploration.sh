cd / # change to the main directory
ls -F # lists files
sudo apt update # update the package list
sudo apt upgrade # upgrade all the installed packages to the latest version
sudo apt install parted # install parted
sudo parted -l && echo -e "\n---\n"  && lsblk -f && echo -e # combines several instructions to display detailed information about disk and partitions
lsblk -f # show information about your block devices 
[ -d /sys/firmware/efi ] && echo "UEFI" || echo "BIOS" # this command detect if you start on BIOS or UEFI
echo "mi archivo" > test.txt # create a file
ls # list files
cat test.txt # show file content
stat test.txt # show the detailer content of the file