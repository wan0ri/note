---
title: AWS Firewall Manager
---

## 1. サービス概要

AWS Firewall Manager は、AWS WAF や AWS Shield などのセキュリティルールを一元管理し、複数の AWS アカウントやアプリケーションにわたってセキュリティポリシーを適用・保守するためのマネージドサービスである。  
これにより、全アカウント・複数リージョンにおけるファイアウォール設定の整合性を保ち、脅威からの保護を統一的に運用できる。

主なユースケースとして、

- AWS Organizations を活用したマルチアカウント環境でのセキュリティポリシー統制
- Web アプリケーションへの不正アクセス対策の一元化
- 急増する DDoS 攻撃への包括的対応

などが挙げられます。

## 2. 主な特徴と機能

### 2.1 一元管理によるポリシー適用

Firewall Manager を使用すると、AWS WAF で定義したルールや、AWS Shield Advanced を有効化する設定を中心化して管理できる。  
組織全体で共通のセキュリティポリシーを簡単に適用することで、設定のばらつきや誤ったルール構成を防止する。

- **ポリシー自動適用**: 新規に作成されたリソース（ALB、CloudFront など）にも自動的に WAF/Shield ルールを適用
- **ドリフト防止**: 手動の変更でルール構成が壊れるのを防ぎ、監査性を確保

### 2.2 AWS Organizations 連携

Firewall Manager は AWS Organizations における管理アカウント(Management Account)を通じて、メンバーアカウントのリソース全体をカバーする。  
数十〜数百といった大規模なマルチアカウント環境でも、集中管理によりコストと運用負荷を大幅に削減できる。

### 2.3 AWS Shield Advanced サポート

Firewall Manager は、有料版の DDoS 対策サービスである AWS Shield Advanced とも統合されています。  
例えば特定のロードバランサや CloudFront ディストリビューションを Shield Advanced で保護対象とするポリシーを一括設定し、DDoS 対策の抜け漏れを最小化できる。

### 2.4 セキュリティポリシーの包括的制御

Firewall Manager は AWS WAF ルールの他にも、複数サービスのセキュリティ設定を一括管理できる。  
これにより、異なるプロジェクトやアカウントのリソースに対しても、共通ルールを迅速に展開できる。

## 3. アーキテクチャおよび技術要素

1. AWS Organizations でマルチアカウント構成を管理し、Firewall Manager の管理者(Administrator)アカウントを指定
2. Firewall Manager でポリシー(WAF ルール、Shield Advanced 適用など)を定義
3. 組織内のメンバーアカウントが作成・保有するリソース(CloudFront, ALB, API Gateway 等)に対して、自動的にポリシーが適用
4. ポリシー違反がある場合、警告やレポートを表示して修正を促す

Firewall Manager は AWS WAF、Shield Advanced、VPC Security Group などの設定と連携し、ユーザーは管理対象を選択するだけで一括制御を実現する。

## 4. セキュリティと認証・認可

Firewall Manager の利用にあたっては、次のようなセキュリティ面が重要である:

- **IAM ロール**: Firewall Manager がメンバーアカウントのリソース情報や WAF ルールを変更するために必要な権限を付与
- **Organizations 管理**: AWS Organizations の Administrator/Member アカウントの設定に基づき、ポリシーを強制適用
- **暗号化・監査ログ**: Firewall Manager 自体がカスタマイズ可能なアクセスログは持たないが、AWS WAF ログや CloudTrail を利用し運用状況を監査

## 5. 料金形態

AWS Firewall Manager の料金は以下の要素で構成される:

- **Firewall Manager 月額**: アクティブなポリシー数に基づく月額料金（AWS 公式ページを参照）
- **AWS WAF/Shield Advanced 利用料**: Firewall Manager とは別に、利用する WAF ルール数や Shield Advanced 料金が発生
- **その他**: VPC セキュリティグループ管理ポリシーを利用する場合は追加コストが発生する場合あり

## 6. よくあるアーキテクチャ・設計パターン

Firewall Manager の導入で典型的なパターンには以下がある:

- **Web アプリ防御の標準化**: 全アカウントの ALB や CloudFront に対して共通の WAF ルールセットを適用
- **DDoS プロテクション統合**: AWS Shield Advanced を組織全体に導入し、DDoS 対策を一元管理
- **VPC セキュリティグループの標準化**: 不要に広いポート・IP レンジを利用していないか、組織規模で監視・強制修正
- **自動ポリシー適用**: 新たに作成されたロードバランサや CloudFront ディストリビューションに自動で WAF ルールを追加

## 7. 設定・デプロイ手順（ハンズオン例）

1. AWS Organizations を準備し、管理アカウント(Management Account)を特定
2. Firewall Manager コンソールへ移動し、「Administrator Account」として使用するアカウントを設定
3. ポリシーを新規作成 (例: WAF ポリシー、Shield Advanced ポリシー、セキュリティグループポリシー)
4. 対象となるリソースタイプ(CloudFront, ALB, etc.)とスコープ（含める/除外するアカウントやリソース）を指定
5. 正常にポリシーが適用されているか、違反が検知された場合はレポート内容を確認

## 8. 試験で問われやすいポイント

### 8.1 AWS WAF との連携

- **Firewall Manager の役割**: WAF ルールそのものを作成・編集するのではなく、一元適用・管理が主眼
- **ルールセットの適用**: CloudFront や ALB といった複数エンドポイントに同一ルールを自動適用
- **カスタムルールとマネージドルール**: OWASP Top 10 等のマネージドルールを使って手軽にパターン防御を導入

### 8.2 AWS Shield Advanced との連携

- **有効化ポリシー**: 指定リソースをまとめて Shield Advanced 保護対象にする
- **DDoS 攻撃時のメリット**: 緊急対応サポートや攻撃コスト保護などの Shield Advanced 特典が全リソースに行き渡る
- **コスト考慮**: Shield Advanced は有料のため、対象リソースを明確に絞る

### 8.3 マルチアカウント管理

- **Organizations 統合**: Firewall Manager 管理アカウントを介してメンバーアカウントへのポリシーを強制
- **スコープ設定**: すべてのアカウントを対象にするか、一部だけに適用するか柔軟に調整可能
- **ポリシー違反の可視化**: メンバーアカウント側で誤設定した場合でも、一元的に検知・修正

### 8.4 運用管理と通知

- **EventBridge 連携**: ポリシー違反や新規リソース検出をイベントトリガーとして SNS や Lambda で通知・自動修復
- **コンソールモニタリング**: Firewall Manager ダッシュボードで組織全体のセキュリティポリシー状況を一望
- **ログ連携**: ルール適用状況は CloudTrail や AWS WAF ログで追跡

### 8.5 料金最適化

- **ポリシー数の制御**: 不要なポリシーを増やさないように設計し、Firewall Manager のコストを抑える
- **Shield Advanced 対象最適化**: すべてのリソースを保護対象にするのではなく、本当に重要なエンドポイントのみ適用
- **WAF ルール最適化**: 過剰なカスタムルールや多数のマネージドルールを無闇に適用しない

### 8.6 試験で頻出となる具体的な問われ方と答え

- Q: Firewall Manager で管理できる主なサービスは？
  - A: AWS WAF、AWS Shield Advanced、VPC Security Groups。
- Q: Firewall Manager を利用するメリットは？
  - A: マルチアカウントに対して一元的にセキュリティルールを適用し、保守と運用を効率化。
- Q: Firewall Manager と AWS Organizations の関係は？
  - A: Firewall Manager で一元管理を行うには Organizations 連携が前提。管理アカウントでポリシーを作成し、メンバーアカウントに適用。
- Q: Shield Advanced を Firewall Manager で管理すると何が変わる？
  - A: 組織全体のリソースをまとめて DDoS 対策に含められ、攻撃時のサポートやコスト保護を一括享受できる。
- Q: 料金を抑えるコツは？
  - A: 必要最小限のポリシー設定、重要度に応じた Shield Advanced 適用範囲、WAF ルールの最適化。
