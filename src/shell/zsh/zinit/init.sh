#!/bin/sh

# zinitのインストール
sh -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

# 設定を読み込む
source ~/.zshrc

# zinitをコンパイル
zinit self-update
