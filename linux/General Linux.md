## View journal logs:
```
journalctl --since "1 minute ago"
```


# swap memory

Creating 1gb worth of swap: 

```
cd /var
touch swap.img
chmod 600 swap.img
dd if=/dev/zero of=/var/swap.img bs=1024k count=1000
mkswap /var/swap.img
swapon /var/swap.img
free
echo "/var/swap.img    none    swap    sw    0    0" >> /etc/fstab
free
```