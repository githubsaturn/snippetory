
To run SSH command and exit:
https://unix.stackexchange.com/questions/30400/execute-remote-commands-completely-detaching-from-the-ssh-connection
```
ssh root@remoteserver '/root/backup.sh </dev/null >/var/log/root-backup.log 2>&1 &'
```


## SSH Config



Create a user on server and setup for SSH:
```
adduser myusername
gpasswd -a myusername sudo


mkdir ~/.ssh
chmod 700 ~/.ssh
nano ~/.ssh/authorized_keys
# save private keys
chmod 600 ~/.ssh/authorized_keys
# copy public key content here - single line...

nano /etc/ssh/sshd_config
## Set these:
#  ChallengeResponseAuthentication no
#  PasswordAuthentication no
# UsePAM isn't very important - some say set to no though.

/etc/init.d/ssh reload 
# or /etc/init.d/ssh restart
# or service ssh restart

```


## RSA


Here is a simple step-by-step tutorial on how to setup SSH keys.

- You need a pair of keys (a private and a public key) they can be shared on many machines.
- You need to save the "public" key on the server, the private key would sit on your local machine (laptop).
- SSH to your 
```
ssh-keygen -m PEM -t rsa -b 4096 -C "caprover" -f ./key -q -N ""
cat key            # shows your private key
cat key.pub        # shows your public key
```
Save both of these keys on your laptop as you will need then.
- SSH to your server B, and add your private key as a new line in `/root/.ssh/authorized_keys`


