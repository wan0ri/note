---
title: AWS Security Hub
---

## 1. サービス概要

AWS Security Hub は、複数の AWS セキュリティサービスやパートナー製品の検出結果（Findings）を一元的に集約・管理するサービスである。  
GuardDuty、Amazon Macie、AWS Firewall Manager、AWS Identity and Access Management (IAM) Access Analyzer、Inspector などの検出結果を統合し、脅威・脆弱性の可視化やコンプライアンス準拠度のモニタリングを容易にする。

主なユースケースとして、

- クラウド全体のセキュリティステータスの包括的な把握
- 検出結果を基にしたインシデント対応の迅速化
- レポーティングの効率化

などが挙げられます。  
AWS Organizations との連携により、複数アカウント環境でのセキュリティ運用を集中管理することも可能である。

## 2. 主な特徴と機能

### 2.1 複数ソースからの Findings 統合

Security Hub は、AWS のセキュリティサービス（GuardDuty、Macie、Inspector、IAM Access Analyzer など）やサードパーティパートナー製品からの脅威検出結果（Findings）を一括して可視化する。  
各サービスごとに個別対応する手間を削減し、単一ダッシュボードで全体状況を把握できる。

- **GuardDuty**: ネットワークトラフィックやログを監視し、不審なアクティビティを検知
- **Amazon Macie**: S3 内の機密データ検知やアクセス状況の監査結果を取得
- **Inspector**: EC2 インスタンスやコンテナの脆弱性スキャン結果を統合

### 2.2 コンプライアンスチェックと Best Practice の評価

Security Hub は、AWS Foundational Security Best Practices や各種規格（CIS AWS Foundations Benchmark など）に基づいたベストプラクティスチェックを実行し、準拠度スコアや推奨事項を提示する。  
定期的にチェックし、設定の誤りやセキュリティリスクを早期に把握できる。

### 2.3 統合ダッシュボードでの優先度付け

異なるサービスから集約された Findings には Severity が付与されており、重要度に基づいた優先度付けが可能である。  
重大な問題（高 Severity）を先に対応し、全体のセキュリティリスクを低減する運用が容易になります。

### 2.4 カスタムアクションと自動化

Security Hub は Amazon EventBridge と連携し、Findings をトリガーとして Lambda などのアクションを自動実行できる。  
例えば、脆弱性が見つかったら対象の EC2 インスタンスを隔離する、自動チケットを発行する、SNS で通知するといったワークフローを構築可能である。

### 2.5 マルチアカウント管理

AWS Organizations を活用して、複数 AWS アカウントの Security Hub を一元管理できる。  
管理アカウント（Administrator Account）が全アカウントの Findings を集約し、集中監視やレポート生成を行える。  
大規模環境での運用を効率化し、セキュリティ体制を強化する。

## 3. アーキテクチャおよび技術要素

1. Security Hub を有効化し、集約したいサービス（GuardDuty、Macie、Inspector など）やパートナー製品との連携を設定
2. それぞれのサービスから Findings（検出結果）が Security Hub に送られる
3. Security Hub が Findings を統合的にリスト表示し、Severity や種類などでフィルタ
4. コンプライアンスチェックやベストプラクティス評価を定期的に実施
5. EventBridge ルールで自動化フローを構築（SNS 通知、Lambda 起動など）

これにより、複数のセキュリティツールを横断する形で Findings を一元管理し、即時対応と継続的改善が実現できる。

## 4. セキュリティと認証・認可

Security Hub は、他の AWS サービス同様に IAM を活用して認証・認可を行います:

- **IAM ポリシー**: Security Hub を閲覧・操作できる権限をユーザーやロール単位で設定
- **Cross-Account Access**: マルチアカウントで管理アカウントとメンバーアカウントを紐づける
- **CloudTrail 監査**: Security Hub API 呼び出しも CloudTrail に記録され、追跡可能

各セキュリティサービス自体が Findings を Security Hub に送信するために必要なポリシーやロールも適切に設定する必要がある。

## 5. 料金形態

AWS Security Hub の料金は、主に以下の要素に基づきます:

- **Findings の集約数**: 送信される Findings のボリュームに応じた従量課金
- **コンプライアンスチェック**: Security Hub が実施するベストプラクティス評価の対象リソース数
- **統合サービスの利用料金**: GuardDuty や Macie などの利用料は別途必要

## 6. よくあるアーキテクチャ・設計パターン

Security Hub の代表的な利用パターンは以下の通りです:

- **統合セキュリティ監視**: GuardDuty の脅威検知、Macie の機密データ検出、Inspector の脆弱性診断をまとめて確認
- **インシデント自動対応**: Security Hub の Findings 発生をトリガーに、EventBridge で Lambda を呼び出し、隔離・通報・タグ付け等を自動化
- **コンプライアンス評価**: CIS Benchmarks などのベストプラクティスチェックを定期的に実行し、問題箇所を早期発見
- **マルチアカウントの集中管理**: AWS Organizations との連携で、組織全体のセキュリティ状況を単一の管理者アカウントから把握

## 7. 設定・デプロイ手順（ハンズオン例）

1. AWS コンソールで「AWS Security Hub」を検索し、有効化(Enable Security Hub)
2. 「Settings」→「Integrations」で GuardDuty、Macie、Inspector など連携したいサービスを有効化
3. 「Security Standards」で CIS や Foundational Security Best Practices を有効化し、対象リソースを選択
4. Findings が集約されるダッシュボードを確認し、Severity やサービス別にソート/フィルタして問題点を把握
5. Amazon EventBridge ルールを作成し、高 Severity の Finding 検出時に SNS 通知や Lambda 実行などのアクションを定義

## 8. 試験で問われやすいポイント

### 8.1 サービス統合

- **GuardDuty/Macie/Inspector**: 主な AWS セキュリティサービスの Findings を集約
- **パートナー製品**: Splunk や Palo Alto Networks などとも連携可能
- **ワークフロー自動化**: EventBridge で Lambda やチケットシステムに連携

### 8.2 コンプライアンス評価

- **AWS Foundational Security Best Practices**: AWS 推奨の基本ベストプラクティス
- **CIS Benchmarks**: CIS AWS Foundations Benchmark の評価を自動で実施
- **スコアリング**: 不合格のチェック項目を確認し、修正を試みる流れがよく問われる

### 8.3 マルチアカウント運用

- **Administrator/Member アカウント**: セキュリティ監視を中央集約する構成
- **Organizations 統合**: 複数アカウントが自動的に Security Hub に参加
- **メリット**: 大規模環境でも一括レポート、Findings 一覧、コンプライアンス状況を管理

### 8.4 コスト管理

- **Findings 課金**: 大量の検出結果が発生する場合、GuardDuty や Macie などと合わせてコストを最適化
- **評価対象範囲**: 不要なスタンダードを無効化し、必要最小限のチェックに絞ることも検討

### 8.5 自動修復（Remediation）の設計

- **EventBridge 連携**: Findings を検知 →Lambda 呼び出し → セキュリティルール適用などを自動化
- **SNS 通知**: 管理者にメールやチャット通知で迅速なインシデント対応
- **パートナー統合**: SOAR プラットフォームなどに Findings を渡し、自動的にワークフロー実行

### 8.6 試験で頻出となる具体的な問われ方と答え

- Q: Security Hub で一元管理できるセキュリティ情報は？
  - A: GuardDuty や Macie、Inspector などの Findings およびコンプライアンスチェック結果。
- Q: Security Hub が提供するコンプライアンス評価は？
  - A: AWS Foundational Security Best Practices、CIS AWS Foundations Benchmark などの自動チェック。
- Q: High Severity の Finding に対し自動でアクションを起こすには？
  - A: EventBridge ルールで特定 Severity の Finding をトリガーに Lambda/SNS などを連携。
- Q: マルチアカウント環境での集中管理を可能にする仕組みは？
  - A: AWS Organizations 連携による管理アカウント(Member/Administrator 構成)。
- Q: Security Hub 自体の料金モデルは？
  - A: Findings 数とコンプライアンスチェック数に基づき従量課金(詳細は公式ページ参照)。
