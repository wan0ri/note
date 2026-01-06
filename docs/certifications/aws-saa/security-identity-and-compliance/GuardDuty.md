---
title: Amazon GuardDuty
---

## 1. サービス概要

Amazon GuardDuty は、AWS アカウントやワークロードを継続的に監視し、異常な振る舞いや不正アクセスの兆候を検知するマネージド型の脅威検出サービスである。  
機械学習や脅威インテリジェンス（Threat Intelligence）を活用することで、セキュリティ運用の高度化および検知精度の向上を実現する。

主なユースケースとして、

- 外部からの不正アクセスや内部的なアカウント乱用の検知
- 暗号通貨マイニングなどの不審行為発見
- マルウェア感染兆候の早期検知

などが挙げられます。  
これらは、ログやイベントを自動的に分析し、重要度に基づいてアラートを上げることで迅速な対処が可能になります。

## 2. 主な特徴と機能

### 2.1 脅威インテリジェンスを活用した検知

GuardDuty では、AWS が統合している AWS Security や外部機関の脅威インテリジェンス情報（悪意ある IP アドレス、ドメイン、ボットネットなど）を活用して、攻撃が疑われる通信を自動的に検知する。  
これにより、既知の不審活動や新種の脅威を大幅に早期発見できる。

- **Amazon 独自の脅威フィード**: 常にアップデートされる最新の脅威情報を反映
- **サードパーティとの連携**: Threat Intel（例: Proofpoint、CrowdStrike 等）を利用

### 2.2 機械学習(ML)ベースの異常検知

GuardDuty は機械学習を用いて、通常とは異なるアクティビティや挙動（異常行動）を検出する機能を提供する。  
例えば、普段は使用しないリージョンからの急激な API コール増加や、アクセス履歴のないサービスでの大規模操作などを捉えて通知する。

### 2.3 データソース(CloudTrail, VPC Flow Logs, DNS Logs)

GuardDuty は以下のログを収集・分析することで、脅威ハンティングや異常検知を実現する:

- **Amazon CloudTrail イベントログ**: AWS アカウントでの API コール履歴
- **VPC Flow Logs**: VPC 内部/外部へのネットワークトラフィックパターン
- **DNS Logs**: Route 53 Resolver DNS クエリのログ

これらを継続的にモニタリングし、不審なアクセスや通信パターンを素早く検知する。

### 2.4 検出結果(Finding)とアラート

GuardDuty が脅威または疑わしい挙動を検知すると、Finding として結果を表示する。  
検出内容には重要度（Severity）が付与され、どのようなアクティビティが検知されたのかを詳細に確認できる。

### 2.5 他 AWS サービスとの連携

GuardDuty は AWS Security Hub や Amazon EventBridge（旧 CloudWatch Events）などと連携することで、自動的な修復フローやチケット発行、メール通知などを実現できる。  
また、AWS Organizations を利用したマルチアカウント管理にも対応しているため、大規模環境でもセキュリティを一括管理できる。

## 3. アーキテクチャおよび技術要素

1. GuardDuty は、AWS 内部のログストリーミング基盤を通じて CloudTrail や VPC Flow Logs、DNS Logs を受け取り。
2. 機械学習エンジンや Threat Intelligence を用いて不審なイベントやアクセスパターンを検知。
3. 検出した脅威は Finding として GuardDuty コンソールに集約。
4. ユーザーはコンソールや EventBridge などを介してアラートを受け取り、自動または手動で対応。

これらのコンポーネントは AWS がフルマネージドで提供しており、ユーザーは検知精度を維持しつつ、複雑なログ解析基盤を自前で構築する必要がありません。

## 4. セキュリティと認証・認可

GuardDuty 自体はセキュリティサービスですが、サービスを利用するにあたっては以下のポイントが重要である:

- **IAM ロールによる権限付与**: GuardDuty を有効化する際、ログへの読み取り権限（CloudTrail、VPC Flow Logs など）を付与するための IAM ロールが使用される。
- **データ機密性の保持**: GuardDuty はログの内容を分析するが、TLS や暗号化された安全な通信を用い、処理は AWS 内部で完結。
- **マルチアカウントのアクセス制御**: AWS Organizations などを活用し、各メンバーアカウントのガバナンスを集中管理可能。

## 5. 料金形態

Amazon GuardDuty の料金は主に以下 2 つの要素に基づきます:

- **ログ分析量**: VPC Flow Logs、CloudTrail、DNS Logs などから収集したログの分析処理量に応じた従量課金。
- **サイジング**: アクティブなアカウント数や分析対象リージョン数により、全体のコストが変動。

## 6. よくあるアーキテクチャ・設計パターン

GuardDuty は脅威検知サービスですが、運用においては他サービスとの連携が鍵となる。  
一般的なパターンは以下の通りです:

- **Security Hub 連携**: GuardDuty の Finding を Security Hub で一元管理し、他のセキュリティサービス（Macie、Inspector など）との統合ビューを提供
- **EventBridge での自動対処**: GuardDuty の Finding をトリガーにして、Lambda を起動し自動修復アクション（例: 不審な EC2 インスタンスの隔離）を実行
- **組織全体でのガバナンス**: AWS Organizations を使用して、複数アカウントで GuardDuty を有効化し、集中管理アカウントで一元的に Finding を把握

## 7. 設定・デプロイ手順（ハンズオン例）

1. AWS コンソールで「Amazon GuardDuty」を検索し、サービスページへ移動
2. 「有効化(Enable GuardDuty)」ボタンをクリックし、初期設定を実施
3. 必要に応じて AWS Organizations によるマルチアカウント統合を設定
4. EventBridge ルールを作成して、特定の Severity 以上の Finding を検知したら SNS 通知や Lambda 実行などのアクションを紐づけ
5. GuardDuty コンソールに戻り、Finding が発生した際に正常に通知・対処フローが起動することを確認

## 8. 試験で問われやすいポイント

### 8.1 データソースと脅威インテリジェンス

- **データソース**: CloudTrail、VPC Flow Logs、DNS Logs の分析が中心
- **Threat Intelligence**: 悪意のある IP やドメインに関する情報を定期的にアップデート
- **検知ロジック**: 機械学習やシグネチャベースの手法を組み合わせた総合的な脅威検知

### 8.2 Finding の理解と Severity

- **Finding**: GuardDuty が検出した脅威・不審挙動を示すイベント
- **Severity**: 低・中・高などで分けられ、対応優先度を判断する指標
- **対処**: 記載されている推奨アクションに従い、リソースの隔離・IAM 権限の確認などを実施

### 8.3 インシデント対応と自動化

- **EventBridge 連携**: GuardDuty の Finding 発生時に自動的に Lambda を呼び出す
- **Security Hub 統合**: Finding を集中管理し、全体のセキュリティステータスを可視化
- **対応フロー**: 不審 EC2 インスタンスの停止、ネットワーク ACL 更新などを迅速に実施

### 8.4 マルチアカウント管理

- **Administrator Account/Member Account**: GuardDuty では一つのアカウントが管理者（Administrator）となり、他をメンバー（Member）として招待
- **AWS Organizations の活用**: GuardDuty を組織単位で自動オンボーディング可能
- **メリット**: セキュリティポリシーや Finding を一元管理し、対応漏れを防ぐ

### 8.5 料金最適化

- **不要リージョンの無効化**: 利用しないリージョンで GuardDuty を停止してコスト削減
- **ログボリュームの把握**: どのアカウント、どのリージョンでどれだけのログが生成されているかを可視化し、異常に多い場合は原因を調査
- **サンプル分析設定**: POC や検証用に一時的に GuardDuty を有効化し、設計フェーズで概算コストを試算

### 8.6 GuardDuty と他のセキュリティサービスとの比較

- **Amazon Macie**: S3 内の機密データ検出に特化。GuardDuty はネットワーク/アカウントの脅威検知
- **Amazon Inspector**: EC2 インスタンスやコンテナイメージの脆弱性をスキャン。GuardDuty は稼働中の不審挙動を検知
- **AWS WAF**: アプリケーションレイヤーの攻撃（SQL インジェクションなど）をブロック。GuardDuty は AWS リソース全般の脅威を広く監視

### 8.7 試験で頻出となる具体的な問われ方と答え

- Q: GuardDuty が分析する主なログソースは？
  - A: CloudTrail、VPC Flow Logs、DNS Logs。
- Q: GuardDuty で検出された不審挙動はどのように表示される？
  - A: Finding として表示され、Severity が付与される。
- Q: マルチアカウント環境で GuardDuty を一括管理する方法は？
  - A: AWS Organizations と Administrator/Member アカウントの設定を利用。
- Q: GuardDuty からの通知をトリガーに自動修復を行うには？
  - A: EventBridge（旧 CloudWatch Events）と Lambda を連携させる。
- Q: Security Hub との連携メリットは？
  - A: 他のセキュリティサービスの検出結果とあわせて一元管理・可視化できる。
