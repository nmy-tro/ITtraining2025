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


## リモートでレポジトリ作成、ローカルにクローン、コミット、プッシュ
1. GitHub にアクセスし、左上の「New」から新しい**レポジトリ**を作成する。「Repository name」を任意に入力し、「Private」に設定、「Add a README file」にチェックを入れて、「Create repository」で作成完了。
2. 作成したレポジトリを開いて、「Code」の SSH URL をコピーする。
3. レポジトリをローカルに**クローン**する。方法は以下の2つ。
   - ターミナルを開き、次を実行するとカレントディレクトリにクローンできる。
        ```
        git clone [上でコピーした SSH URL]
        ```
   - GitHub Desktop アプリを開き、左上の Current Repository > Add > Current Repository > URL を開く。上でコピーした SSH URL を貼り付ける。Local Path は /Users/[Mac のユーザ名] とすると、ホームディレクトリにクローンできる。
4. 上でクローンしたディレクトリを VSCode 等のエディタで開き、変更を任意に加える（新規ファイル作成、ファイル編集等）。
5. 今行った変更をリモートに反映するために、コミットとプッシュを行う。コミットで**ローカル**のレポジトリに変更を記録し、プッシュで**リモート**のレポジトリに変更を反映させる。VSCodeを使っている場合は、左のタブで「SOURCE CONTROL」に移動し、コミットするファイルを選択して、コミットメッセージを入力し、「Commit」> 「Sync Changes」で完了。

## ローカルでレポジトリ作成、コミット (コマンドで実行)
- `git init`: カレントディレクトリにローカルリポジトリを新規作成。 `.git` が作成され、これがレポジトリとなる。
  - 作業するディレクトリ全体を Working Tree と呼ぶ。
- `git add <FILE>`: ファイルを Working Tree から Index（コミット前の準備場所、 Staging Area とも呼ばれる）に登録。
  - `<FILE>` で `.` を指定するとワイルドカードを意味する。
- `git status`: Working Tree、Index の作業状態を確認。
- `git commit -m "コメント"`: Index に登録した作業内容をコミット。
  - `"hoge!"` のように " (ダブルクオート) で囲ったコメントに ! が含まれるとエラーになる。" ではなく ' (シングルクオート) にすると解決する。
  - `--amend` オプションで直前のコミットメッセージを修正できる
- `git log`: コミット履歴を確認。
- `git diff`: Working Tree と Index の差分を表示
- `git diff --cached`: Index と HEAD (一番新しいコミット) の差分を表示
- `git restore <FILE> `: Working Tree 上の変更を取り消す。Index に登録された変更には影響を与えない。
- `git restore --staged <FILE>`: Index に登録した変更を Working Tree に差し戻す
- `git reset HEAD`: Index に登録した変更を **全て**　Working Tree に差し戻す
- `git reset HEAD~n`: n (>0) 個前のコミットを指定してそこまで HEAD の位置を戻す。
  - `~n` を `^` とすると、**1**個前という意味になる
  - 取り払ったコミット分の変更をどう扱うかをオプションで指定できる
    - `--mixed`(デフォルト): Working Tree に取り込む
    - `--soft`:  Index に取り込む
    - `--hard`: 一切を取り込まない
- `git branch`: ローカルブランチの一覧を表示
- `git branch <BRANCH_NAME>`: 新しいブランチを作成する
- `git push origin <BRANCH_NAME>`: リモートにプッシュする
- git checkout <BRANCH_NAME>`: ブランチを切り替える

> [!NOTE]
> ローカルレポジトリでは、あるブランチで行った変更が未commit（Working Tree に変更が残っている状態）の場合、別のブランチでその変更を見ることができてしまう。つまり、Working Tree の状態はブランチをまたいで引き継がれる。`add` だけ行って `commit` は行っていない場合も同様。したがって、`add` は Working Tree の状態を Index にコピーしているのであり、移すわけではないと言える。



