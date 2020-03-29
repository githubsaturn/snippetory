Samba NAS setup

For maximum compatibility, use NTFS on your external drive if you want to use Samba

```
sudo apt-get install samba samba-common-bin
sudo smbpasswd -a pi
# enter your pi password
```

Permission:
```
# make sure 
cd /your/shared/path
sudo chmod -R 777 .
```

Config:
```
# If you use Ubuntu GUI, it'll be in /var/lib/samba/usershares
pi@raspberrypi:~ $ cat /etc/samba/smb.conf 
[global]
        map to guest = Bad User
        log file = /var/log/samba/%m
        log level = 1

[wd-shared]
        path = /your/shared/path/
        read only = no
        guest ok = yes
        guest only = yes
        create mask = 0777
        directory mask = 0777
```

