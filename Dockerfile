# ベースイメージを指定
FROM ubuntu:20.04

# 作業ディレクトリを/appに設定
WORKDIR /app

# 環境変数を表示するスクリプトをコピー
COPY . .
# スクリプトを実行するコマンド
CMD ["./training_2025"]
