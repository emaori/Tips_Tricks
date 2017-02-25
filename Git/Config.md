### Useful git config parameters ###

[alias]
```
lg = log --oneline --decorate --color --graph --pretty=format:'%Cblue%h%Creset %Cgreen(%ci)%Creset %Cblue(%an)%Creset %C(yellow)%d%Creset %s'
unstage = reset HEAD
discard = checkout --
s = status -s
aa = add --all
co = commit -m
ac = commit -a -m
pom = push origin master
pod = push origin dev
po = push origin
p = pull
dt = difftool
merge-local = merge --no-ff --no-commit
config-global = config --global -l
config-system = config --system -l
config-local = config --local -l
```

[core]
```
# To use VS code as tool for commit and add -p
editor = "code --wait --new-window"
```

[diff]
```
tool = default-difftool
```

[difftool "default-difftool"]
```
# To use VS code as diff tool
cmd = code --wait --diff $LOCAL $REMOTE
```

[mergetool "p4merge"]
```
path = C:\\Program Files\\Perforce\\p4merge.exe
```
[merge]
```
tool = p4merge
```
