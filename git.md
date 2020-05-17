### Merge last two commits into one:

https://stackoverflow.com/questions/2563632/how-can-i-merge-two-commits-into-one-if-i-already-started-rebase

```
git reset --soft "HEAD^"
git commit --amend
```


## git status all subdirectories
```
find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '(echo {} && cd {} && git status -s && echo)' \;
```
From https://coderwall.com/p/grmruq/git-status-on-all-repos-in-folder


### Search all history for instance of a string being added/removed

https://stackoverflow.com/questions/5816134/how-to-find-the-git-commit-that-introduced-a-string-in-any-branch

```
git log -S <whatever> --source --all
git log -G <regex> --source --all
```

Examples:
```
git log -S 'hello world' --source --all
git log -S "dude, where's my car?" --source --all
git log -G "^(\s)*function foo[(][)](\s)*{$" --source --all
```
