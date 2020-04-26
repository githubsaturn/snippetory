## PDF to jpg
```
mogrify -density 144 -format jpg *pdf
```
This works much better than `convert` with regards to the quality.

## Compress PDF
From [here](https://askubuntu.com/questions/113544/how-can-i-reduce-the-file-size-of-a-scanned-pdf-file)
```
convert -density 200x200 -quality 60 -compress jpeg input.pdf output.pdf
```


## View journal logs:
```
journalctl --since "1 minute ago"
```



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
