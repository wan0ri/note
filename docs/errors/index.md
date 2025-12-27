---
title: エラー
---

# エラーノート（ラフメモ）

CLI やツールのエラー出力をそのまま貼り付け、最短で原因/回避をメモする置き場です。

記載ルール（ラフで OK）

- 先頭に一言タグ: `terraform`, `aws`, `docker`, `k8s` など
- 可能なら発生条件（コマンド/環境）と最短の回避策
- 生ログはコードブロックに貼る（スクロール可）

```bash
# 生ログサンプル
Error: Failed to ...
  with module.xxx,
  on main.tf line 42, in module "xxx":
  42:  module "xxx" { ... }
```

関連:

- [Terraform のエラー](terraform.md)
- [その他 CLI のエラー](cli.md)
