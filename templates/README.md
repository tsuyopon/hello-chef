# MEMO
もしsyntaxチェックをしたければ以下で可能です。
```
$ erb -x -T '-' templates/ntp.conf.erb | ruby -c
Syntax OK
```
