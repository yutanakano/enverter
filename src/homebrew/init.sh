#!/bin/sh
set -e

CURRENT="$(cd "$(dirname "$0")" && pwd)"

# -------------------------------------------------
# Brewfile パスの設定
# -------------------------------------------------
BREWFILE_PATH="$HOME/.Brewfile"

# Brewfile の存在を確認し、フラグに記録
BREWFILE_EXISTS=false
if [ -f "$BREWFILE_PATH" ]; then
    echo "Using existing Brewfile at: $BREWFILE_PATH"
    BREWFILE_EXISTS=true
else
    echo "Brewfile not found at: $BREWFILE_PATH"
fi

# -------------------------------------------------
# Homebrew のインストール
# -------------------------------------------------
if ! command -v brew >/dev/null 2>&1; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || { echo "Error: Homebrew installation failed"; exit 1; }
else
    echo "Homebrew is already installed"
fi

# Homebrew が正しくインストールされたか確認
if ! command -v brew >/dev/null 2>&1; then
    echo "Error: brew command not found after installation"
    exit 1
fi

# -------------------------------------------------
# Brewfile の作成（存在しない場合のみ）
# -------------------------------------------------
# 現在インストールされているパッケージを記録
if [ "$BREWFILE_EXISTS" = false ]; then
    echo "Creating Brewfile from current Homebrew installations..."
    brew bundle dump --force --describe --file="$BREWFILE_PATH" || { echo "Error: Failed to dump Brewfile"; exit 1; }
    echo "✅ Brewfile created at: $BREWFILE_PATH"
fi

# -------------------------------------------------
# Homebrew のメンテナンス
# -------------------------------------------------
echo "Running brew doctor..."
brew doctor || echo "Warning: brew doctor found some issues (non-fatal)"

echo "Running brew update..."
brew update || { echo "Error: brew update failed"; exit 1; }

echo "Running brew upgrade..."
brew upgrade || echo "Warning: brew upgrade had some issues (non-fatal)"

# -------------------------------------------------
# Brewfile からのインストールと更新（Brewfile が存在していた場合のみ）
# -------------------------------------------------
if [ "$BREWFILE_EXISTS" = true ]; then
    # Brewfile に記載されたパッケージをインストール
    echo "Running brew bundle..."
    brew bundle --file="$BREWFILE_PATH" || { echo "Error: brew bundle failed"; exit 1; }

    # インストール後の最新状態を Brewfile に記録（更新）
    echo "Updating Brewfile with latest state..."
    brew bundle dump --force --describe --file="$BREWFILE_PATH" || { echo "Error: Failed to dump Brewfile"; exit 1; }
    echo "✅ Brewfile updated at: $BREWFILE_PATH"
fi
