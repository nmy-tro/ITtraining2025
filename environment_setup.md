# 新卒の環境構築

## アプリをインストールする
### Homebrew（macOS用のパッケージマネージャー）
1.  [Homebrew](https://brew.sh/) のサイトにアクセスして、「インストール」下のコマンドをコピーし、ターミナルに貼り付けて実行。
2.  ターミナルで `brew -v` を実行し「Homebrew [バージョン]」が表示されれば完了。もし「zsh: command not found: brew」と表示されたら、以下を実行することで `brew` コマンドのパスを通す。
3. 　ターミナル上で `cd ~` を実行しホームディレクトリに移動。`ls -a` で .zshrc ファイルが存在するか確認する。もしなければ，`touch .zshrc` で .zshrc ファイルを作成する。
4. `open .zshrc` で　.zshrc ファイルを開き `export PATH=$PATH:/opt/homebrew/bin/`をファイルに貼り付けて保存する。
5. `source ~/.zshrc` で zsh を更新する。これで `brew` コマンドが使用可になったはずなので、再度　`brew -v`　を実行して確かめる。

### Git, GitHub
1. Homebrew のインストール時に Git もインストールされているはずなので、`git -v` で確認する。
2. GitHub アカウントを会社の Gmail アドレスを使って作成する。[GitHub](https://github.co.jp/) のサイトにアクセスし「サインアップ」から作成できる。
3. GitHub Desktop アプリをインストールする。[ダウンロードページ](https://github.com/apps/desktop?ref_cta=download+desktop&ref_loc=installing+github+desktop&ref_page=docs) の「Download now」> 「Download for macOS」からインストールできる。
4. GitHub Desktop を開き、上で作成したアカウントでサインインする。

### Docker 
1. [Docker Desktop](https://www.docker.com/ja-jp/products/docker-desktop/) のサイトからアプリをインストール。
2. アプリを開いて、アカウントを会社の Gmail アドレスを使って作成する。


## アプリを使ってみる