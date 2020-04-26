

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