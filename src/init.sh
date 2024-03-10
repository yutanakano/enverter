#!/bin/sh

# rosetta
/usr/sbin/softwareupdate --install-rosetta --agree-to-license

CURRENT="$(cd "$(dirname "$0")" && pwd)"
if [ ! -e ~/ghq ]; then
    # ghqを作成
    mkdir ~/ghq
fi
if [ ! -e ~/.ssh ]; then
    # .sshを作成
    mkdir ~/.ssh
fi
if [ ! -e ~/.config ]; then
    # .configを作成
    mkdir ~/.config
fi
if [ ! -e ~/.local ]; then
    # .localを作成
    mkdir -p ~/.local/share/nvim/site/pack/packer/opt/
fi
if [ ! -e ~/.gitmoji ]; then
    # .gitmojiを作成
    mkdir ~/.gitmoji
fi

# dotfile
sh "$CURRENT/dotfile/init.sh"

# homebrew
sh "$CURRENT/homebrew/init.sh"

# shell
sh "$CURRENT/shell/zsh/zinit/init.sh"

# mise
sh "$CURRENT/mise/init.sh"

# fig
sh "$CURRENT/fig/init.sh"
