## rsync
For backup on external drive use `rsync`

```
rsync -aP /path/to/src/dir /path/to/destination/
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
sudo dd bs=4M if=/dev/sdb of=./raspbian.img
sudo sync
```

Restore:
```
sudo dd bs=4M if=./raspbian.img of=/dev/sdb
sudo sync
```
