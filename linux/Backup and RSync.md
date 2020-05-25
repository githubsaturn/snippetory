## rsync
For backup on external drive use `rsync`

```
rsync -aP /path/to/src/dir /path/to/destination/

# if you also want to delete the deleted files
rsync -aP /path/to/src/dir /path/to/destination/  --delete
# TRY AVOID USING THE DELETE OPTION IN CRONJOBS. ALSO, ALWAYS TEST WITH --dry-run.
```

`a` is for achive which is combination of serveral other flags, e.g., keeping the permissions hardlinks and etc.
`P` is for showing progress

Note that the source directory doesn't have a trailing slash but the destination does. In this case, `dir` directory will be present at `/path/to/destination/dir`


## Clonezilla

For full disk clone, use CloneZilla. Good tutorial here: https://www.youtube.com/watch?v=EW4_tqBaczw


## dd
Ref: [this](https://www.raspberrypi.org/documentation/linux/filesystem/backup.md) and [this](https://help.ubuntu.com/community/DriveImaging) and [this](https://thepihut.com/blogs/raspberry-pi-tutorials/17789160-backing-up-and-restoring-your-raspberry-pis-sd-card) and [this]() 

`dd` is basically the command line version of Clonezilla. For example, if we want to snapshot a rasberry pie image:

Backup:
```
sudo lsblk
# Make sure that all partitions are unmounted before you start!
sudo umount /dev/mmmdrive1
sudo umount /dev/mmmdrive2


DATE_TEXT=`date +"%m-%d-%y"` ; \
sudo dd bs=4M if=/dev/sdb of=./raspbian_$DATE_TEXT.img ; \
sudo sync
```

Restore:
```
sudo lsblk
# Make sure that all partitions are unmounted before you start!
sudo umount /dev/mmmdrive1
sudo umount /dev/mmmdrive2

sudo dd bs=4M if=./raspbian.img of=/dev/sdb
```

(not tested yet) but for rasberry pi, look into this: https://github.com/Drewsif/PiShrink/blob/master/pishrink.sh
