## 概要

個人用テックノート（MkDocs + Material）。  
学習や業務で得た知見を素早く検索・参照できることを目的に、上部タブでセクションを整理しています。

- デプロイ先: https://wan0ri.github.io/note/
- テーマ: mkdocs-material（日本語化、タブナビ、ダーク/ライト切替対応）
- 主なセクション:
  - プラットフォーム（k8s/コンテナ/仮想化）、
  - インフラ基盤（OS/ネットワーク/セキュリティ/ハードウェア）、
  - クラウド（3 大クラウド/IaC/可観測性）、
  - DevOps（CI/CD/開発手法）、
  - ミドルウェア、
  - 言語、
  - エラー

---

## テーマの変更（Material）

テーマや機能は `mkdocs.yml` で管理します。

- `theme.name: material` と各種 `features` を有効化（タブナビ、目次追従など）
- ダーク/ライト切替は `palette` の 2 スキームを定義
- アイコンやリポジトリ表示は `icon` / `repo_url` / `repo_name` で制御
- 追加拡張（必要に応じて ON/OFF）
  - Markdown 拡張: `pymdownx.*`（タブ、ハイライト、タスクリストなど）
  - プラグイン: `glightbox`, `redirects`, `git-revision-date-localized` ほか

> 注意: ヘッダーレイアウトの強い改修は基本オフ（テーマ更新で壊れやすいため）。必要になった場合は `overrides/` にテンプレートを配置する分岐運用を検討する。

---

## セットアップ（初回）

### 前提

macOS / Linux、Python 3.10+（本リポジトリでは 3.14 系の仮想環境を使用）

```bash
cd /Users/<username>/project/note
python -m venv .venv
source .venv/bin/activate
pip install -U pip
pip install -r requirements.txt
```

### 依存関係（requirements.txt 抜粋）

- mkdocs-material / mkdocs-material-extensions / pymdown-extensions
- mkdocs-git-revision-date-localized-plugin / mkdocs-glightbox / mkdocs-redirects

---

## 構築後のローカル確認

```bash
source .venv/bin/activate
mkdocs serve
# ブラウザ: http://127.0.0.1:8000
```

よくあるポイント

- 別ターミナルで `mkdocs serve` 実行時は、仮想環境の有効化を忘れない（`No module named 'material'` 回避）
- SPA キャッシュで見た目の差分が見えないときはハードリロード、または URL に `?v=YYYYMMDD` を付与

---

## ディレクトリ構成（抜粋）

```
docs/
  index.md
  platform/            # k8s / コンテナ / 仮想化
    containers/
      docker-commands.md
      image-build.md    # Dockerfile 基本
      compose.md        # Docker Compose 基本
  infra-base/          # OS / ネットワーク / セキュリティ / ハードウェア
  cloud/               # 3大クラウド / IaC / 可観測性
  devops/              # CI/CD / 開発手法
  middleware/
  language/
  errors/              # エラー置き場（Terraform / その他CLI）
mkdocs.yml             # テーマ/プラグイン/ナビ定義
```

---

## デプロイ（GitHub Pages）

ワークフロー: `.github/workflows/gh-pages.yml`

- `main` または `master` へ push で自動ビルド＆ `gh-pages` へデプロイ
- 手動実行（要トークン）は以下でも可
  ```bash
  source .venv/bin/activate
  mkdocs gh-deploy --force
  ```

初回のみ GitHub Pages 設定で公開ブランチを `gh-pages` に設定する。

---

## トラブルシュート（簡易）

- `cannot find module 'material.extensions.emoji'` など
  - 仮想環境が無効、または依存未インストール → `.venv` を有効化して `pip install -r requirements.txt`
- ページ下部の「前へ/次へ」を隠したい
  - `mkdocs.yml` の `theme.features` から `navigation.footer` を外す（既に外して運用）
- 編集/原文表示ボタンを隠したい
  - `content.action.edit` / `content.action.view` を `features` から外す（既に外して運用）

---

## ライセンス / 注意

本リポジトリのドキュメントは個人の学習・業務メモです。  
引用元がある場合は各ページ内に記載します。
