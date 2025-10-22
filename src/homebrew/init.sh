#!/bin/sh
set -e

CURRENT="$(cd "$(dirname "$0")" && pwd)"

# Brewfile path handling
if [ -n "$1" ]; then
    # Convert relative path to absolute path
    case "$1" in
        /*)
            # Already absolute path
            BREWFILE_PATH="$1"
            ;;
        *)
            # Relative path - convert to absolute
            BREWFILE_DIR="$(cd "$(dirname "$1")" 2>/dev/null && pwd)" || { echo "Error: Invalid path directory"; exit 1; }
            BREWFILE_PATH="$BREWFILE_DIR/$(basename "$1")"
            ;;
    esac
else
    # Default to ~/.Brewfile
    BREWFILE_PATH="$HOME/.Brewfile"
fi
BREWFILE_EXISTS=false

# Check if Brewfile exists
if [ -f "$BREWFILE_PATH" ]; then
    echo "Using existing Brewfile at: $BREWFILE_PATH"
    BREWFILE_EXISTS=true
else
    echo "Brewfile not found at: $BREWFILE_PATH"
fi

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

# Create Brewfile if it doesn't exist
if [ "$BREWFILE_EXISTS" = false ]; then
    echo "Creating Brewfile from current Homebrew installations..."
    brew bundle dump --force --describe --file="$BREWFILE_PATH" || { echo "Error: Failed to dump Brewfile"; exit 1; }
    echo "✅ Brewfile created at: $BREWFILE_PATH"
fi

echo "Running brew doctor..."
brew doctor || echo "Warning: brew doctor found some issues (non-fatal)"

echo "Running brew update..."
brew update || { echo "Error: brew update failed"; exit 1; }

echo "Running brew upgrade..."
brew upgrade || echo "Warning: brew upgrade had some issues (non-fatal)"

# If Brewfile existed, install and update
if [ "$BREWFILE_EXISTS" = true ]; then
    echo "Running brew bundle..."
    brew bundle --file="$BREWFILE_PATH" || { echo "Error: brew bundle failed"; exit 1; }

    echo "Updating Brewfile with latest state..."
    brew bundle dump --force --describe --file="$BREWFILE_PATH" || { echo "Error: Failed to dump Brewfile"; exit 1; }
    echo "✅ Brewfile updated at: $BREWFILE_PATH"
fi
