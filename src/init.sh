#!/bin/sh
set -e

echo "Starting enverter setup..."

CURRENT="$(cd "$(dirname "$0")" && pwd)"

# homebrew
echo "Setting up Homebrew..."
sh "$CURRENT/homebrew/init.sh" || { echo "Error: Homebrew setup failed"; exit 1; }

# shell
echo "Setting up shell (zinit)..."
sh "$CURRENT/shell/zsh/zinit/init.sh" || { echo "Error: shell setup failed"; exit 1; }

# mise
echo "Setting up mise..."
sh "$CURRENT/mise/init.sh" || { echo "Error: mise setup failed"; exit 1; }

echo "✅ enverter setup completed successfully!"
