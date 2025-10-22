#!/bin/sh

# rosetta
/usr/sbin/softwareupdate --install-rosetta --agree-to-license

CURRENT="$(cd "$(dirname "$0")" && pwd)"

# dotfile
sh "$CURRENT/dotfile/init.sh"

# homebrew
sh "$CURRENT/homebrew/init.sh"

# shell
sh "$CURRENT/shell/zsh/zinit/init.sh"

# mise
sh "$CURRENT/mise/init.sh"
