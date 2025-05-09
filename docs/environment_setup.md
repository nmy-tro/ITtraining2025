# Mac の環境構築

## Homebrew
1. ターミナルを開く。
> [!TIP] 
> アプリを開くときは Launchpad を使うのが一般的だが、**Spotlight** 検索を使うと、キーボードだけで開くことができる。Spotlight は Command + スペースバー で起動する。
2. [Homebrew](https://brew.sh/) のサイトにアクセスして、インストール用のコマンドをコピーし、ターミナルに貼り付けて実行。
3. ターミナルで次のコマンドを実行する。
    ```
    brew -v
    ```
    `Homebrew [バージョン]` と表示されれば完了。もし `zsh: command not found: brew` と表示されたら、`brew` コマンドの**パスを通す**必要がある。

> [!NOTE] 
> **パスの通し方**
> 1. ホームディレクトリに移動。
>     ```
>     cd ~
>     ```
> 2. ディレクトリ内のファイルを全て表示する。
>     ```
>     ls -a
>     ```
> 3. 表示されたリストに .zshrc ファイルが存在するか確認する。もしなければ，次のコマンドで .zshrc ファイルを作成する。
>     ```
>     touch .zshrc
>     ```
> 4. .zshrc ファイルを開く。
>     ```
>     open .zshrc
>     ```
> 5. 開いた .zshrc ファイルに次を貼り付けて保存し、閉じる。
>     ```
>     export PATH=$PATH:/opt/homebrew/bin/
>     ```
> 6.  zsh を更新する。
>     ```
>     source ~/.zshrc
>     ```
> 7. 以上で `brew` コマンドが使用可になったはず。再度次のコマンドを実行し、バージョンが表示されるか確かめる。
>     ```
>     brew -v
>     ```


## Git と GitHub
1. Homebrew のインストール時に Git もインストールされているはずなので、次のコマンドで確認する。
    ```
    git -v
    ``` 
2. GitHub アカウントを会社の Gmail アドレスを使って作成する。[GitHub](https://github.co.jp/) のサイトにアクセスし「サインアップ」から作成できる。
3. GitHub Desktop アプリをインストールする。[ダウンロードページ](https://github.com/apps/desktop?ref_cta=download+desktop&ref_loc=installing+github+desktop&ref_page=docs) の「Download now」> 「Download for macOS」からインストールできる。
4. GitHub Desktop を開き、上で作成したアカウントでサインインする。
    

## Docker
1. [Docker Desktop](https://www.docker.com/ja-jp/products/docker-desktop/) のサイトからアプリをインストール。
2. アプリを開いて、アカウントを会社の Gmail アドレスを使って作成する。