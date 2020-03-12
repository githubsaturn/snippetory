

Blackhole attacker IP

FROM: https://www.cyberciti.biz/tips/how-do-i-drop-or-block-attackers-ip-with-null-routes.html
```
ip route add blackhole 123.123.123.123

```



View journal logs:
```
journalctl --since "1 minute ago"
```

To run SSH command and exit:
https://unix.stackexchange.com/questions/30400/execute-remote-commands-completely-detaching-from-the-ssh-connection
```
ssh root@remoteserver '/root/backup.sh </dev/null >/var/log/root-backup.log 2>&1 &'
```




To run multiple commands in parallel:
https://stackoverflow.com/questions/10909685/run-parallel-multiple-commands-at-once-in-the-same-terminal

```
#!/bin/bash

for cmd in "$@"; do {
  echo "Process \"$cmd\" started";
  $cmd & pid=$!
  PID_LIST+=" $pid";
} done

trap "kill $PID_LIST" SIGINT

echo "Parallel processes have started";

wait $PID_LIST

echo
echo "All processes have completed";
```
Usage:
```
parallel_commands "cmd arg0 arg1 arg2" "other_cmd arg0 arg2 arg3"
```


Grep recursive:
```
grep --include="*View.java" -nRHI "setVisibility" *
```