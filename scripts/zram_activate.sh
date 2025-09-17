modprobe zram
echo lzo > /sys/block/zram0/comp_algorithm

# dedicate at least 50% of RAM to compression space (could try for 100% theoretically)
echo 6G > /sys/block/zram0/disksize

mkswap /dev/zram0
swapon /dev/zram0 -p 10
