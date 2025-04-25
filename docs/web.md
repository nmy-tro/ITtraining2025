# Web 入門

## HTMLファイルを作成しブラウザで閲覧する
- HTMLファイルを適当に作成。
    ```html
    <!DOCTYPE html>
    <html lang="ja">
    <head>
        <title>HTMLの練習</title>
    </head>
    <body>
        初めてのWebページです。
    </body>
    </html> 
    ```
- ブラウザにファイルをドラッグ・アンド・ドロップすると閲覧できる。

## nginx で HTMLファイルを開く
- nginx をインストール。    
    ```
    brew install nginx
    ```
- インストールが完了したかを確認。
    ```
    nginx -v
    ```
- nginx を起動する。
    ```
    brew services start nginx
    ```
- ブラウザで以下にアクセスし、デフォルトページを閲覧。
    ```
    http://localhost:8080
    ```
    ![](/images/nginx.png)
- nginx の設定ファイルを確認。
    ```
    cat /opt/homebrew/etc/nginx/nginx.conf
    ```
    設定ファイルの中身は以下のようになっているはず。
  ```
  ...
  server {
        listen       8080;
        server_name  localhost;
        location / {
            root   html;
            index  index.html index.htm;
        }
        ...
  }
  ...
    ```
- ドキュメントルート (root) を以下のように変更。
  - 変更前: `html;` (意味は `/opt/homebrew/Cellar/nginx/<バージョン>/html`)
  - 変更後: `/opt/homebrew/var/www;`
- nginx を再起動。
    ```
    brew services restart nginx
    ```
- 開きたい HTML ファイルをドキュメントルートの `/opt/homebrew/var/www/` 配下に置く。
- ブラウザで以下にアクセスすると閲覧できる。
    ```
    http://localhost:8080/<FileName>
    ```

## Docker で nginx コンテナを起動して、HTML ファイルを開く
- nginx のイメージを pull して起動。
    ```
    docker run --rm --name my-nginx -d -p 8080:80 nginx
    ```
    - `-p 8080:80`: ホストの8080ポートをコンテナの80ポートに接続。
- ブラウザで以下にアクセスし、デフォルトページを閲覧。
    ```
    http://localhost:8080
    ```
- HTML ファイルを閲覧する。まずはホストのディレクトリ（HTML ファイルを置く場所）をコンテナにマウントする。
    ```
    docker run --rm --name my-nginx -d -p 8080:80 -v <ディレクトリのパス>:/usr/share/nginx/html:ro nginx
    ```
  - `ro`: read-only mode
  - `-p x:y`: 外部のポートx とコンテナ内部のポート y を接続
  - `/usr/share/nginx/html`: ドキュメントルート

 ## ブラウザの仕組み
- URL の形式 (例: https://www.brains-tech.co.jp/news/)
   - `https://`: プロトコル
   - `www.brains-tech.co.jp`: ドメイン名。`localhost` などもこれに該当
     - :を区切り文字としてポートを指定することが可能。ウェブブラウザでは指定がない場合、基本ポートである 80 を使う。
     - しかし、UNIX系OS（macOS, Linuxなど）では、ポート番号が 1024 未満のものは、管理者権限でないと使えない。8080 はその代替ポートとしてよく使われる。
       - nginx を Mac にインストールした場合: `listen       8080;`
       - Docker の nginx コンテナを起動した場合: `listen       80;`
   - `news/`: パス
- 流れ
    1. 入力された URL のうちドメイン名を使って DNS サーバに問い合わせ、IP アドレスを取得。
    2. IP アドレスとパスで Web サーバーに問い合わせ、コンテンツを取得する。
       1. パスは、ドキュメントルートからのパス
    3. 取得したコンテンツを表示する。（今回は取り扱わない）