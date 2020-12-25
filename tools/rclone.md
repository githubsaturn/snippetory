https://rclone.org/

1- Install rclone


2- Run `rclone config`
- New remote
- name: `mydropbox`
- select all default values and it opens a browser session and fetches the auth token
- Once it's all set, you can copy files


3- Run
```
rclone copy ./test mydropbox:some/path/ -P
```
- if `test` is a file, it'll sit in `/some/path/test`
- if `test` is a directory, "the content" will sit in `/some/path/*`
- rclone automatically creates the destination path
