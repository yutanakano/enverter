#!/bin/sh
set -e

# Check if mise is installed
if ! command -v mise >/dev/null 2>&1; then
    echo "Error: mise is not installed"
    exit 1
fi

echo "Installing mise runtimes..."

# バージョンの追加
echo "Installing rust@1.67.1..."
mise install rust@1.67.1 || { echo "Error: Failed to install rust"; exit 1; }

echo "Installing python@3.11.0..."
mise install python@3.11.0 || { echo "Error: Failed to install python"; exit 1; }

echo "Installing node@20.13.1..."
mise install node@20.13.1 || { echo "Error: Failed to install node"; exit 1; }

# globalに設定
echo "Setting global versions..."
mise use -g rust@1.67.1 || { echo "Error: Failed to set global rust"; exit 1; }
mise use -g python@3.11.0 || { echo "Error: Failed to set global python"; exit 1; }
mise use -g node@20.13.1 || { echo "Error: Failed to set global node"; exit 1; }

echo "✅ mise setup completed"
