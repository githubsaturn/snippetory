

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


To create a new "window" within the same session, `^A C` . Then do `^A N` / `^A P` to go to next/previous.



`^A |` to create a new pan
`^A tab` to move to the new pan on the right/left
`^A C` to create a new window
`^A N` / `^A P` to go to next/previous

