#!/bin/bash

set -x

# script_dir=$(dirname $0)
# makefile_override="$script_dir/makefile_override"
# mkdir -p .kmax/topleveldirs
# for arch in $(ls arch/ | egrep -v ".gitignore|Kconfig"); do
#   echo -n "arch/$arch " > .kmax/topleveldirs/$arch
#   timeout 4 make ARCH=$arch -f "$makefile_override" alldirs 2>/dev/null >> .kmax/topleveldirs/$arch
# done
# /usr/bin/time kmaxall -z $(cat .kmax/topleveldirs/* | tr ' ' '\n' | sort | uniq) > .kmax/kmax
kmax --version
/usr/bin/time kmaxall -z $(find arch/ -maxdepth 1 -mindepth 1 | egrep -v ".gitignore|Kconfig") block certs crypto drivers fs init ipc kernel lib mm net samples security sound usr virt  > .kmax/kmax
