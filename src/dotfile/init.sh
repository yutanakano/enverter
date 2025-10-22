#!/bin/sh

CURRENT="$(cd "$(dirname "$0")" && pwd)"

# ssh
mkdir -p ~/.ssh
ln -nfs "$CURRENT"/.ssh/config ~/.ssh/config
# tmux
mkdir -p ~/.config/tmux
ln -nfs "$CURRENT"/.config/tmux ~/.config/tmux
# zellij
mkdir -p ~/.config/zellij
ln -nfs "$CURRENT"/.config/zellij/layouts ~/.config/zellij/layouts
# starship
mkdir -p ~/.config
ln -nfs "$CURRENT"/.config/starship.toml ~/.config/starship.toml
# .zshrc
ln -nfs "$CURRENT"/.zshrc ~/.zshrc
# .gitconfig
if [ ! -f "$CURRENT"/.gitconfig ]; then
    echo "Setting up .gitconfig..."
    cp "$CURRENT"/.gitconfig.template "$CURRENT"/.gitconfig
    read -p "Enter your name: " git_name
    read -p "Enter your email: " git_email
    sed -i.bak "s/YOUR_NAME/$git_name/" "$CURRENT"/.gitconfig
    sed -i.bak "s/YOUR_EMAIL/$git_email/" "$CURRENT"/.gitconfig
    rm "$CURRENT"/.gitconfig.bak
fi
ln -nfs "$CURRENT"/.gitconfig ~/.gitconfig
# .gitmoji
mkdir -p ~/.gitmoji
ln -nfs "$CURRENT"/.gitmoji/gitmojis.json ~/.gitmoji/gitmojis.json
# .tmux.conf
ln -nfs "$CURRENT"/.tmux.conf ~/.tmux.conf
