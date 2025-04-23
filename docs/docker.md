# Docker とは
- コンテナ型仮想化アプリ。 アプリケーションとその実行に必要なもの（ライブラリ等）をコンテナとしてパッケージ化できる。
- 用語
  - コンテナ: ホストマシン上の隔離された領域のこと。
  - イメージ: コンテナの実行に必要なパッケージで、ファイルやメタ情報を集めたもの。複数の**レイヤー**から成る。ホストマシンのどこかに `.img` のような具体的な単一のファイルが存在するわけではない。Docker Hub に公開されている。
  - Dockerfile: 既存のイメージにレイヤーをさらに積み重ねるためのテキストファイル。
  - Docker CLI: `docker run` や `docker build` のような docker ではじまるコマンドのこと
- Docker を使った環境構築の流れ: 
  1. 環境の設計書（Dockerfile）を作成
  2. Dockerfile からイメージをビルド
  3. イメージからコンテナを作成
- Dockerfile やイメージが手に入れば、手元のマシンに環境を実現できるので。他者と開発環境を統一しやすい。
- コマンド
  - `container run`: イメージからコンテナを作る。実は次のコマンドを一気に行っている
    - image pull
    - container create
    - container start
  - `container exec` はコンテナに命令を送る。
  - `image pull`: Docker Hub からイメージ（あるいはイメージのセット、レポジトリと呼ぶ）をダウンロードする。
  - `image build`: Dockerfile からイメージを作る。
- Docker のコマンドは 2017 年 1 月にリリースされた v1.13 で大幅な変更が行われた。
    
    | 旧コマンド | 新コマンド |
    | ---- | ---- |
    | docker build | docker image build|
    | docker run | docker container run|
    | docker pull |	docker image pull |
    | docker create | docker container create |
    | docker start | docker container start |
    | docker images | docker image ls |
    | docker ps	| docker container ls |
- `docker run [option] <image> [command]`
  - `<image>` はほとんどの場合、`REPOSITORY:TAG` の形式で、`TAG` を省略すると `latest` を指定したことになる。
- `docker run` のオプション

    | オプション | 意味 | 用途 |
    | ----- | ----- | ----- | 
    | -i <br> --interactive | コンテナの標準入力に接続する | コンテナを対話操作する |
    | -t <br> --tty | 擬似ターミナルを割り当てる |	コンテナを対話操作する |
    | -d <br> --detach | バックグラウンドで実行する	| ターミナルが固まるのを避ける |
    | --rm | 停止済コンテナを自動で削除する | 起動時に停止済コンテナと一意な情報が衝突するのを避ける |
    | --name | コンテナに名前をつける |	コンテナを指定しやすくする |
    | --platform | イメージのアーキテクチャを明示する | M1 Mac で必要な場合がある|
    | --volume <br> -v | コンテナにボリューム or ホストOSのファイルをマウントする <br> `-v [マウント元]:[マウント先]`　 | コンテナ内での作業を記録する |
- `docker container exec [コンテナ名] [コマンド]`
- `apt update`: ローカルのパッケージリストを更新する
- `apt install -y vim`: vim をインストール。`-y` オプションはインストール時の問い合わせにすべて yes で答える
- `docker volume create [option]`: ボリューム（コンテナ内のファイルをホストマシン上で Docker が管理してくれる仕組み）を作成
  - `--name` オプションが使用可能
- `docker volume ls`: ボリュームの一覧を確認



> [!NOTE]
> Windows 仮想マシンは、Mac 上で動作しているのではなく、サーバー上で動作している Windows が Mac を通して見えているだけ。


# Docker を使ってみる

- Dockerにログインする。
    ```
    docker login -u [ユーザ名]
    ```

- `pull` と `run` 
    ```
    # イメージを持ってくる
    docker pull hello-world

    # コンテナをつくる（インスタンス化）
    docker run hello-world 
    ```
    出力:
    ```
    Hello from Docker!
    This message shows that your installation appears to be working correctly.

    To generate this message, Docker took the following steps:
    1. The Docker client contacted the Docker daemon.
    2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
        (arm64v8)
    3. The Docker daemon created a new container from that image which runs the
        executable that produces the output you are currently reading.
    4. The Docker daemon streamed that output to the Docker client, which sent it
        to your terminal.

    To try something more ambitious, you can run an Ubuntu container with:
    $ docker run -it ubuntu bash

    Share images, automate workflows, and more with a free Docker ID:
    https://hub.docker.com/

    For more examples and ideas, visit:
    https://docs.docker.com/get-started/
    ```