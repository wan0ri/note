---
title: Docker Compose 基本
---

# Docker Compose 基本

サービスの定義、依存関係、ボリュームやネットワークの扱いを整理します。

```yaml
services:
  app:
    build: .
    ports:
      - "8000:8000"
    environment:
      - LOG_LEVEL=info
    depends_on:
      - db
  db:
    image: postgres:16
    volumes:
      - pg:/var/lib/postgresql/data
volumes:
  pg: {}
```
