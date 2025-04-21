# Git を使ってみる

## GitHub に SSH Key を設定
1. ターミナルで次のコマンドを実行し、キーファイルを生成する。
     ```
     ssh-keygen
     ```
2. 次のコマンドを実行し、`id_rsa` と `id_rsa.pub` の2つのファイルの存在を確認する。
    ```
    ls ~/.ssh/
    ```
3. GitHub にアクセスし、右上のプロフィールアイコン > Settings > SSH and GPG Keys > New SSH Key を開く。
4. Title を入力する。例: [ユーザー名]_public_key
5. Key type は「Authentication Key」。
6. Key には上で生成した `id_rsa.pub` ファイルの中身をコピーして貼り付ける。
7. 「Add SSH Key」ボタンで完了。
8. ターミナルで次を実行し、「yes」で完了。
    ```
    ssh -T git@github.com
    ```


## レポジトリ作成 ~ クローン
1. GitHub にアクセスし、左上の「New」から新しい**レポジトリ**を作成する。「Repository name」を任意に入力し、「Private」に設定、「Add a README file」にチェックを入れて、「Create repository」で作成完了。
2. 作成したレポジトリを開いて、「Code」の SSH URL をコピーする。
3. レポジトリをローカルに**クローン**する。方法は以下の2つ。
   - ターミナルを開き、次を実行するとカレントディレクトリにクローンできる。
        ```
        git clone [上でコピーした SSH URL]
        ```
   - GitHub Desktop アプリを開き、左上の Current Repository > Add > Current Repository > URL を開く。上でコピーした SSH URL を貼り付ける。Local Path は /Users/[Mac のユーザ名] とすると、ホームディレクトリにクローンできる。
  
  ## コミットとプッシュ
1. 上でクローンしたディレクトリを VSCode 等のエディタで開き、変更を任意に加える（新規ファイル作成、ファイル編集等）。
2. 今行った変更をリモートに反映するために、コミットとプッシュを行う。コミットで**ローカル**のレポジトリに変更を記録し、プッシュで**リモート**のレポジトリに変更を反映させる。VSCodeを使っている場合は、左のタブで「SOURCE CONTROL」に移動し、コミットするファイルを選択して、コミットメッセージを入力し、「Commit」で完了。