---
title: Docker 基本コマンド
---

# Docker 基本コマンド

よく使うコマンドのチートシート。

```bash
# イメージ操作
docker pull <image>
docker images
docker rmi <image>

# コンテナ操作
docker run --rm -it <image> /bin/sh
docker ps -a
docker stop <container> && docker rm <container>

# ネットワーク/ボリューム
docker network ls
docker volume ls
```
