#!/bin/sh
set -e

CURRENT="$(cd "$(dirname "$0")" && pwd)"

# brew
echo "Linking Brewfile..."
ln -nfs "$CURRENT"/Brewfile ~/.Brewfile || { echo "Error: Failed to link Brewfile"; exit 1; }

# Check if brew is already installed
if ! command -v brew >/dev/null 2>&1; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || { echo "Error: Homebrew installation failed"; exit 1; }
else
    echo "Homebrew is already installed"
fi

# Ensure brew is available
if ! command -v brew >/dev/null 2>&1; then
    echo "Error: brew command not found after installation"
    exit 1
fi

echo "Running brew doctor..."
brew doctor || echo "Warning: brew doctor found some issues (non-fatal)"

echo "Running brew update..."
brew update || { echo "Error: brew update failed"; exit 1; }

echo "Running brew upgrade..."
brew upgrade || echo "Warning: brew upgrade had some issues (non-fatal)"

echo "Running brew bundle..."
brew bundle --global || { echo "Error: brew bundle failed"; exit 1; }
