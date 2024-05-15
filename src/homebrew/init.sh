#!/bin/sh

CURRENT="$(cd "$(dirname "$0")" && pwd)"

# brew
ln -nfs "$CURRENT"/Brewfile ~/Brewfile

echo "installing homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" >/dev/null 2>&1

echo "run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade..."
brew upgrade

brew bundle --global
