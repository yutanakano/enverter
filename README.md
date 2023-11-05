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

2. 端末用に追加のフォントをインストールします。Powerlevel10k テーマを設定し、必要なフォントを追加するには、以下のコマンドを使用します。
   ```
   p10k configure
   ```

3. すべての変更と設定が有効になるように、ターミナルを再起動してください。

## ライセンス

このプロジェクトは [MIT ライセンス](LICENSE) のもとにライセンスされています。