Samba NAS setup

For maximum compatibility, use NTFS on your external drive if you want to use Samba

```
sudo apt-get install samba samba-common-bin
sudo smbpasswd -a pi
# enter your pi password
```


## Public Access

Permission:
```
# make sure for /your/shared/path permissions are good:

cd /
chmod 755 ./your

cd /your
chmode 755 ./shared

cd ./shared
sudo chmod -R 777 path
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

## Password Protected
From here: https://wiki.samba.org/index.php/Setting_up_Samba_as_a_Standalone_Server

Create the user and group:
```
MY_SAMBA_USER=demoUser
MY_SAMBA_GROUP=demoGroup
MY_SAMBA_PATH=/srv/samba/demo/
useradd -M -s /sbin/nologin $MY_SAMBA_USER
passwd $MY_SAMBA_USER
smbpasswd -a $MY_SAMBA_USER
groupadd $MY_SAMBA_GROUP
usermod -aG $MY_SAMBA_GROUP $MY_SAMBA_USER
chgrp -R $MY_SAMBA_GROUP $MY_SAMBA_PATH
chown -R $MY_SAMBA_USER  $MY_SAMBA_PATH
chmod -R 2770 $MY_SAMBA_PATH

pdbedit -L -v # view list of users
```

Create config:
```
$ cat /etc/samba/smb.conf

[global]
        map to guest = Bad User
        log file = /var/log/samba/%m
        log level = 1

[shelf]
        path = /srv/samba/demo/
        read only = no
```


Restart:
```
service smbd restart
ufw allow samba
```
