#!/bin/sh

CURRENT="$(cd "$(dirname "$0")" && pwd)"

# brew
ln -nfs "$CURRENT"/.Brewfile ~/.Brewfile
# ssh
ln -nfs "$CURRENT"/.ssh/config ~/.ssh/config
# nvim
ln -nfs "$CURRENT"/.config/nvim ~/.config/nvim
# tmux
ln -nfs "$CURRENT"/.config/tmux ~/.config/tmux
# starship
ln -nfs "$CURRENT"/.config/starship.toml ~/.config/starship.toml
# packer
ln -nfs "$CURRENT"/.local/share/nvim/site/pack/packer/opt/packer.nvim ~/.local/share/nvim/site/pack/packer/opt/packer.nvim
# .zshrc
ln -nfs "$CURRENT"/.zshrc ~/.zshrc
# .p10k.zsh
ln -nfs "$CURRENT"/.p10k.zsh ~/.p10k.zsh
# .gitconfig
ln -nfs "$CURRENT"/.gitconfig ~/.gitconfig
git update-index --skip-worktree "$CURRENT/.gitconfig"
# .gitmoji
ln -nfs "$CURRENT"/.gitmoji/gitmojis.json ~/.gitmoji/gitmojis.json
# .tmux.conf
ln -nfs "$CURRENT"/.tmux.conf ~/.tmux.conf
