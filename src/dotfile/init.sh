#!/bin/sh

CURRENT="$(cd "$(dirname "$0")" && pwd)"

# ssh
ln -nfs "$CURRENT"/.ssh/config ~/.ssh/config
# tmux
ln -nfs "$CURRENT"/.config/tmux ~/.config/tmux
# starship
ln -nfs "$CURRENT"/.config/starship.toml ~/.config/starship.toml
# .zshrc
ln -nfs "$CURRENT"/.zshrc ~/.zshrc
# .gitconfig
ln -nfs "$CURRENT"/.gitconfig ~/.gitconfig
git update-index --skip-worktree "$CURRENT/.gitconfig"
# .gitmoji
ln -nfs "$CURRENT"/.gitmoji/gitmojis.json ~/.gitmoji/gitmojis.json
# .tmux.conf
ln -nfs "$CURRENT"/.tmux.conf ~/.tmux.conf
