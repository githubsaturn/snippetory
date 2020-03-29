
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
