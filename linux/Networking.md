

### Blackhole attacker IP

FROM: https://www.cyberciti.biz/tips/how-do-i-drop-or-block-attackers-ip-with-null-routes.html
```
ip route add blackhole 123.123.123.123

```

### Wildcard DNS Ubuntu
https://askubuntu.com/a/1031896/438814

Make sure your `resolv.conf` is pointing to Network Manager's one:
```
ls -la /etc/resolv.conf
lrwxrwxrwx 1 root root /etc/resolv.conf -> /var/run/NetworkManager/resolv.conf
```
Now add an entry:
```
echo 'address=/.myrouter.net/192.168.1.1' | sudo tee /etc/NetworkManager/dnsmasq.d/example.com-wildcard.conf
```


### Port in use

From https://www.cyberciti.biz/faq/unix-linux-check-if-port-is-in-use-command/
 
```
sudo lsof -i -P -n | grep LISTEN
sudo netstat -tulpn | grep LISTEN
sudo lsof -i:22 ## see a specific port such as 22 ##
sudo nmap -sTU -O IP-address-Here

```


### Assigning Static Private IP to a machine:
[this](https://linuxconfig.org/how-to-configure-static-ip-address-on-ubuntu-18-04-bionic-beaver-linux) is a comprehensive guide.


if it's using netplan (Ubuntu 18+), from [here](https://netplan.io/examples)
```
kasra@laptop ➜  ~ cat /etc/netplan/50-cloud-init.yaml
# This file is generated from information provided by the datasource.  Changes
# to it will not persist across an instance reboot.  To disable cloud-init's
# network configuration capabilities, write a file
# /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg with the following:
# network: {config: disabled}
network:
    ethernets:
        eth0:
            match:
                macaddress: 00:11:22:33:44:55
            # dhcp4: true
            addresses:
                - 192.168.1.66/24
            gateway4: 192.168.1.1
            nameservers:
                search: [home]
                addresses: [192.168.1.1]
            # if you want wake on lan: #   wakeonlan: true
    version: 2
```

Otherwise, if you're using RPie or older Ubuntu that uses `ifupdown`, do this:
```
➜  ~ cat /etc/dhcpcd.conf
interface eth0
  static ip_address=192.168.1.55/24
  static routers=192.168.1.1
  static domain_name_servers=127.0.0.1
```
in this example `domain_name_servers=127.0.0.1` is set because the device has a local DNS server running (PiHole).

From [here](https://www.ionos.com/digitalguide/server/configuration/provide-raspberry-pi-with-a-static-ip-address/) and [here](https://thepihut.com/blogs/raspberry-pi-tutorials/how-to-give-your-raspberry-pi-a-static-ip-address-update)


### Wake on lan
See separate file
