# Git を使ってみる

## レポジトリ作成 ~ クローン
1. GitHub にアクセスし、左上の「New」から新しい**レポジトリ**を作成する。「Repository name」を任意に入力し、「Private」に設定、「Add a README file」にチェックを入れて、「Create repository」で作成完了。
2. 作成したレポジトリを開いて、「Code」の SSH URL をコピーする。
3. レポジトリをローカルに**クローン**する。方法は以下の2つ。
   - ターミナルを開き、次を実行するとカレントディレクトリにクローンできる。
        ```
        git clone [上でコピーした SSH URL]
        ```
   - GitHub Desktop アプリを開き、左上の Current Repository > Add > Current Repository > URL を開く。上でコピーした SSH URL を貼り付ける。Local Path は /Users/[Mac のユーザ名] とすると、ホームディレクトリにクローンできる。
