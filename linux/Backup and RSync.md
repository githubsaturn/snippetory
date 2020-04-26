For backup on external drive use `rsync`

```
rsync -aP /path/to/src/dir /path/to/destination/
```

`a` is for achive which is combination of serveral other flags, e.g., keeping the permissions hardlinks and etc.
`P` is for showing progress

Note that the source directory doesn't have a trailing slash but the destination does. In this case, `dir` directory will be present at /path/to/destination/dir`



For full disk clone, use CloneZilla
