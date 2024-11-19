#!/bin/bash
# Синхронизация с репозтория Git в локальный репозиторий Pappet
# Code_Dir - путь к локальному репозиторию.


Code_Dir='./oss/puppet-code'
Local_git='./r10k_home/code/environments'

[ -d ./r10k_home ] || (mkdir ./r10k_home && chmod 0770 ./r10k_home && chown root:docker ./r10k_home)

[ -f ./r10k_home/r10k.yaml ] || cat <<EOF >./r10k_home/r10k.yaml
:cachedir: '/home/puppet/cache'
:sources:
 :panda:
  remote: 'https://github.com/P2Andy/puppet-test.git'
  basedir: '/home/puppet/code/environments'
  ignore_branch_prefixes: ["master", "develop"]
#
EOF

docker run -it -v ./r10k_home:/home/puppet --rm puppet/r10k deploy environment

rsync -Paq --exclude=".*" --no-perms --no-owner --no-group --delete-after $Local_git $Code_Dir