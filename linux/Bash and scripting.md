


## To run multiple commands in parallel:
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

## xargs

```
printf "1\n2\n3\n" | xargs touch # creates 3 files!
printf "1\t2\t3\t" | xargs -d "\t" touch # creates 3 files!
ls | xargs rm # deletes all files!
printf "1\n2\n3\n" | xargs -it touch {}.txt   # creates 3 files with txt extension

```

## Exit process after specific log
```
program -a something | sed -e '/I finished all the good work/q'
``


## Delete all [sub]directories with some specific name
rm -rf `find -type d -name node_modules`
