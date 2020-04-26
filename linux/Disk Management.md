## Basics

`/dev/sda` and `/dev/sdb` and etc refer to actual drive.
`/dev/sda1` and `/dev/sda2` are "partitions" which can be formatted.

Use `parted` or `gparted` (graphical) to partition your disk. 
For each disk, you can create 4 primary partitions and one extended partition hosting MANY LOGICAL partitions.
Typically you create one or two primary and the rest are logical.

1) Create partition table, usually `mbr` (with limitation on four primary partitions) ,or modern `gpt` with no limitations.
`mbr` is typically used.

2) Create a partition and choose a format (EXT4, NTFS, FAT or etc)
- Use NTFS if you want cross-platform compatibility 
- Individual files on a FAT32 drive can't be over 4 GB in size
- EXT4 is journaling and better in stability compared to EXT2

https://www.howtogeek.com/235596/whats-the-difference-between-fat32-exfat-and-ntfs/

Note:
For steps above, you can either use `gparted` if you have GUI access. If you don't, use `fdisk` or `parted`. 
The primary reason to use `parted` is if the new disk is bigger than 2TB.

If you can use `fsdisk`, here are the steps:
- Use `fdisk -l` or `fdisk -l /dev/sdb` to get info
- Use `fdisk /dev/sdb` to start partitioning the disk.
- Enter `m` for help.
- Enter `n` to create new partition
- Enter 1 for Partition Number and 1 for First Cylinder
- Enter `+100M` for size in MB.
- Enter `p` to print the results
- Enter `n` to create another one, partition 2, and use `extended`, then create more logical ones.
- Enter `w` to write the changes!


3) Put a filesystem on a partition `mkfs -t ext4 /dev/sdb1`
Or, use `mkfs -t ext4 -m 0 /dev/sdb1` to don't save any space for root user (not necessary if this is a secondary drive)


## Disk Mounting

Run `mount` to view the currently mounted dirs.

1) Connect a new disk, external drive or etc.

2) Get the UUID and `/dev` location of disk by running `blkid` or `lsblk`

3) Temporary mount the disk: (resets after a reboot)
```
mount /dev/sda1 /test
```

3) Permanently mount, `/etc/fstab` to add the following line
```
UUID=2EE334A14F29361D       /some/existing/path/to/mount          ntfs-3g    defaults,users,noatime,nofail,x-systemd.device-timeout=10,rw,umask=0000          0       2
```
Note that `umask` flag cannot be used with `ext4`.

Run `mount -a` to reload this file.

Note that if you're using `ntfs`, you have to `apt-get install ntfs-3g` and use `ntfs-3g` in `fstab` 



## Disk Space

- Use `df -hT` to get the big picture
- Use `du -ha` to get details about current directory

