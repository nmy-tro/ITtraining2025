# Docker とは
- 「ホスト型仮想化」と「コンテナ型仮想化」
- とにかく環境構築がラク
- 「macOS に Ubuntu の環境を構築する」は普通は大変だけど、Dockerを使えば簡単
- 自分の環境を設計書（イメージ）として他者に共有することができるので、環境の統一が容易

# Docker を使ってみる

- Dockerにログインする。
    ```
    docker login -u [ユーザ名]
    ```

- `pull` コマンドと `run` コマンド
    ```
    docker pull hello-world
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