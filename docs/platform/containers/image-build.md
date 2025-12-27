---
title: Dockerfile 基本
---

# Dockerfile 基本

ベースイメージ選定、レイヤ最適化、マルチステージ、キャッシュ戦略などを整理。

```dockerfile
FROM python:3.12-slim AS base
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
CMD ["python", "main.py"]
```

ポイント

- マルチステージでビルド時依存を最終イメージに含めない
- `COPY` の順序でキャッシュ最適化
- ルートレス/ユーザ指定、不要なパッケージ削減
