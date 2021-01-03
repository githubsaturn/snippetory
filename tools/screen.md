

To start, install `screen`


Run `screen` to start a new session, to detach while running the session, press `^A D` (ctrl-A then D)


To view the running sessions
```
screen -ls
```


To reattach just run
```
screen -r <first few chars of session name via screen -ls>
## if only one screen session, no need to enter sessions 
```
