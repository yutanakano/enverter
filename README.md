# enverter

`enverter` は macOS 環境を設定するためのスクリプトです。

## 使い方

以下のコマンドを実行してください。

```shell
sh src/init.sh
```

## 初回実行時のステップ

初回実行時だけ追加で以下のステップを実行する必要があります。

1. GitHub CLI を使い鍵の作成を行います。
   ```
   gh auth login
   ```

2. すべての変更と設定が有効になるように、ターミナルを再起動してください。
3. vscodeとiTerm2にfontを適用してください

## Brewfile

### 動作仕様

`~/.Brewfile` を使用して以下のように動作します：

#### Brewfile が存在する場合
1. Homebrew をインストール（未インストールの場合）
2. `brew doctor` / `brew update` / `brew upgrade` を実行
3. `brew bundle` で Brewfile からパッケージをインストール
4. `brew bundle dump` で最新状態を Brewfile に記録（更新）

#### Brewfile が存在しない場合
1. Homebrew をインストール（未インストールの場合）
2. `brew bundle dump` で現在インストールされているパッケージを Brewfile として作成
3. `brew doctor` / `brew update` / `brew upgrade` を実行

### Brewfile の手動更新

パッケージを追加・削除した後、Brewfile を手動で更新する場合：

```bash
brew bundle dump --force --describe --file ~/.Brewfile
```

## ライセンス

このプロジェクトは [MIT ライセンス](LICENSE) のもとにライセンスされています。
