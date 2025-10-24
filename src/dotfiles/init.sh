#!/bin/sh
set -e

CURRENT="$(cd "$(dirname "$0")" && pwd)"

echo "Setting up dotfiles..."

# Create necessary directories
echo "Creating directories..."
mkdir -p ~/.ssh
mkdir -p ~/.config/tmux
mkdir -p ~/.config/zellij
mkdir -p ~/.gitmoji

# ssh
echo "Linking SSH config..."
ln -nfs "$CURRENT"/.ssh/config ~/.ssh/config || { echo "Error: Failed to link SSH config"; exit 1; }

# tmux
echo "Linking tmux config..."
ln -nfs "$CURRENT"/.config/tmux ~/.config/tmux || { echo "Error: Failed to link tmux config"; exit 1; }

# zellij
echo "Linking zellij layouts..."
ln -nfs "$CURRENT"/.config/zellij/layouts ~/.config/zellij/layouts || { echo "Error: Failed to link zellij layouts"; exit 1; }

# starship
echo "Linking starship config..."
ln -nfs "$CURRENT"/.config/starship.toml ~/.config/starship.toml || { echo "Error: Failed to link starship config"; exit 1; }

# .zshrc
echo "Linking .zshrc..."
ln -nfs "$CURRENT"/.zshrc ~/.zshrc || { echo "Error: Failed to link .zshrc"; exit 1; }

# .gitconfig
if [ ! -f ~/.gitconfig ]; then
    echo "Setting up .gitconfig..."
    cp "$CURRENT"/.gitconfig.template ~/.gitconfig || { echo "Error: Failed to copy .gitconfig template"; exit 1; }
    read -p "Enter your name: " git_name
    read -p "Enter your email: " git_email
    sed -i.bak "s/YOUR_NAME/$git_name/" ~/.gitconfig || { echo "Error: Failed to update name"; exit 1; }
    sed -i.bak "s/YOUR_EMAIL/$git_email/" ~/.gitconfig || { echo "Error: Failed to update email"; exit 1; }
    rm ~/.gitconfig.bak
    echo "✅ .gitconfig created"
else
    echo ".gitconfig already exists, skipping"
fi

# .gitmoji
echo "Linking gitmoji config..."
ln -nfs "$CURRENT"/.gitmoji/gitmojis.json ~/.gitmoji/gitmojis.json || { echo "Error: Failed to link gitmoji config"; exit 1; }

echo "✅ Dotfiles setup completed"
