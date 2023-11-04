#!/bin/sh
# プラグインの追加
asdf plugin add rust
asdf plugin add python
asdf plugin add nodejs
# バージョンの追加
asdf install rust 1.67.1
asdf install python 3.11.0
asdf install nodejs 16.20.2
asdf install nodejs 18.18.2
asdf install nodejs 19.9.0
asdf install nodejs 20.9.0
asdf install nodejs 21.1.0
# globalに設定
asdf global rust 1.67.1
asdf global python 3.11.0
asdf global nodejs 21.1.0