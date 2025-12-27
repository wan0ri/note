---
title: Terraform のエラー
---

# Terraform のエラー

ラフメモで構いません。コマンドとバージョン、必要なら最短の回避策を添えてください。

```
terraform version
terraform init -upgrade
terraform plan
```

```bash
# 例: provider 競合
Error: Failed to query available provider packages
│ Could not retrieve the list of available versions for provider ...
```
