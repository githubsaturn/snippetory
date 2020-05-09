

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
