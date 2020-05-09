Inner details of workings [here](https://www.digitalocean.com/community/tutorials/how-fail2ban-works-to-protect-services-on-a-linux-server)

```
apt install fail2ban
fail2ban-client status
cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
systemctl restart fail2ban
systemctl status fail2ban
fail2ban-client set sshd banip 123.123.123.123 # bans the ip address
fail2ban-client set sshd unbanip 123.123.123.123 # unbans the ip address

awk '($(NF-1) = /Ban/){print $NF}' /var/log/fail2ban.log | sort | uniq -c | sort -n
```



## OpenVPN:

From [here](https://www.fail2ban.org/wiki/index.php/HOWTO_fail2ban_with_OpenVPN) and [here](https://gist.github.com/drmalex07/463e4c7356bcfb2b3d21ff9fdc5aa6b3).

1) Create `/etc/fail2ban/filter.d/openvpn.local` containing:
```
# Fail2Ban filter for selected OpenVPN rejections
#
#



[Definition]

# Example messages (other matched messages not seen in the testing server's logs):
# Fri Sep 23 11:55:36 2016 TLS Error: incoming packet authentication failed from [AF_INET]59.90.146.160:51223
# Thu Aug 25 09:36:02 2016 117.207.115.143:58922 TLS Error: TLS handshake failed

failregex = ^.*\sTLS Error: incoming packet authentication failed from \[AF_INET\]<HOST>:\d+$
            ^.*\s<HOST>:\d+ Connection reset, restarting
            ^.*\s<HOST>:\d+ TLS Auth Error
            ^.*\s<HOST>:\d+ TLS Error: TLS handshake failed$
            ^.*\s<HOST>:\d+ VERIFY ERROR

ignoreregex = 

```
2) Create `/etc/fail2ban/jail.d/openvpn.local` containing:
```
# Fail2Ban configuration fragment for OpenVPN

### CHANGE 1194 and udp if needed

[openvpn]
enabled  = true
port     = 1194
protocol = udp
filter   = openvpn
logpath  = /var/log/openvpn.log
maxretry = 3
```


Check regex:
```
raspberrypi# fail2ban-regex -v /var/log/openvpn.log /etc/fail2ban/filter.d/openvpn.local        
```