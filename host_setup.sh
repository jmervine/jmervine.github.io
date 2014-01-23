#!/usr/bin/env bash
#
# curl -sSL https://github.com/jmervine/me/edit/master/host_setup.sh | bash # -s centos
#
# The resulting configuration has been verified on:
#
# * VIM 7.2.411 and some later versions.
# * ZSH 4.3.10
# * TMUX 1.6
#

ALTERNATE=false
test "$1" && ALTERNATE=true

# clean up old stuff if needed
rm -rf ~/.dotfiles ~/.vim-config

set -ue
github="git@github.com:jmervine"
test "$(echo "$( { ssh -T git@github.com; } 2>&1 )" | grep "successfully authenticated")" || github="https://github.com/jmervine"
set -x

cd ~
git clone $github/dotfiles.git .dotfiles
cd .dotfiles
if $ALTERNATE
then
  git checkout $1
fi
bash ./install.sh

cd ~
git clone $github/vim-config.git .vim-config
cd .vim-config

if $ALTERNATE
then
  git checkout $1
fi

bash ./install.sh

set +x
echo "
1.) Logout and log back in.
2.) Launch vim and run: ':BundleInstall!'
"

