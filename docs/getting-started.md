---
title: Getting Started
description: ローカルでのプレビューと構成の基本。
---

# クイックスタート

MkDocs Material を使った本ノートの編集/プレビュー手順です。

## ローカルプレビュー

```bash
cd /Users/wan0ri/project/note
source .venv/bin/activate
mkdocs serve
```

ブラウザで `http://127.0.0.1:8000` を開きます。

## ディレクトリ構成

```
docs/
  index.md            # ホーム（ヒーロー + カード）
  getting-started.md  # このページ
  language/
  infra/
  tools/
```

ページを追加したら、`mkdocs.yml` の `nav:` に追記します。

## よく使う記法

### アドモニション（メモ/注意/ヒント）

```markdown
!!! tip "ヒント"
    ここに内容。
```

### タブ

```markdown
=== "Python"
    ```py
    print("hello")
    ```

=== "Bash"
    ```bash
    echo hello
    ```
```

### 絵文字（Twemoji + SVG）

`:material-rocket-launch:` などのアイコン短縮表記が使えます。

