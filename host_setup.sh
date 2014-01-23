#!/usr/bin/env bash

test "$1" && ALTERNATE="$1"

set -ue
github="git@github.com:jmervine"
test "$(echo "$( { ssh -T git@github.com; } 2>&1 )" | grep "successfully authenticated")" || github="https://github.com/jmervine"
set -x

git clone $github/dotfiles.git .dotfiles
cd .dotfiles
if test "$ALTERNATE"
then
  git checkout $ALTERNATE
fi
bash ./install.sh

git clone $github/vim-config.git .vim-config
cd .vim-config

if test "$ALTERNATE"
then
  git checkout $ALTERNATE
fi

bash ./install.sh

echo "
1.) Logout and log back in.
2.) Launch vim and run: ':BundleInstall!'
"

