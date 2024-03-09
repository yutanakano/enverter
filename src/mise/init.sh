#!/bin/sh
# バージョンの追加
mise install rust@1.67.1
mise install python@3.11.0
mise install node@21.1.0
# globalに設定
mise use -g rust@1.67.1
mise use -g python@3.11.0
mise use -g node@21.1.0
