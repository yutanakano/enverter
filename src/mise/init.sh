#!/bin/sh
set -e

# Check if mise is installed
if ! command -v mise >/dev/null 2>&1; then
    echo "Error: mise is not installed"
    exit 1
fi

echo "Installing mise runtimes..."
mise install || { echo "Error: Failed to install mise runtimes"; exit 1; }

echo "✅ mise setup completed"
