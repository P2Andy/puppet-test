## Script Start_r10k.sh

Для нормальной работы скрипта необходимо установить rsync и поправить путь для манифестов Code_Dir.


## Настройка исходника в Git

```shell
sources:
  mysource:
    remote: "git://git-server.site/mysource/main-modules"
    basedir: "/etc/puppet/environments"
    ignore_branch_prefixes:
      - "test"
      - "dev"
```
