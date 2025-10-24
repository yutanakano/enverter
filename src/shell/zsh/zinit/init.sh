#!/bin/sh
set -e

echo "Installing zinit..."

# zinitのインストール
sh -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)" || { echo "Error: zinit installation failed"; exit 1; }

echo "✅ zinit installed successfully"
echo "Note: Please restart your terminal and run 'zinit self-update' to compile zinit"
