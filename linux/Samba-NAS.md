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

## Password Protected
From here: https://wiki.samba.org/index.php/Setting_up_Samba_as_a_Standalone_Server

Create the user and group:
```
useradd -M -s /sbin/nologin demoUser
passwd demoUser
smbpasswd -a demoUser
groupadd demoGroup
usermod -aG demoGroup demoUser
chgrp -R demoGroup /srv/samba/demo/
chown -R demoUser  /srv/samba/demo/
chmod -R 2770 /srv/samba/demo/

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
