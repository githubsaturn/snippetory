PDF to jpg
```
mogrify -density 144 -format jpg *pdf
```
This works much better than `convert` with regards to the quality.


View journal logs:
```
journalctl --since "1 minute ago"
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

