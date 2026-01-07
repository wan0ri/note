---
title: AWS Serverless Application Repository
---

## 1. サービス概要

AWS Serverless Application Repository は、AWS が提供するフルマネージドサービスで、サーバーレスアプリケーションを共有、検索、デプロイするためのリポジトリである。  
このサービスを利用することで、開発者は AWS Lambda 関数、API Gateway、DynamoDB テーブル、その他のサーバーレスリソースをパッケージ化し、共有できる。  
また、他の開発者が公開したサーバーレスアプリケーションを検索し、簡単にデプロイできる。

主なユースケースとして、

- 組織内でのサーバーレスコンポーネントの共有
- 再利用可能なサーバーレスアプリケーションの公開
- コミュニティでのサーバーレスソリューションの共有

などが挙げられる。

## 2. 主な特徴と機能

## 2.1 サーバーレスアプリケーションの共有

Serverless Application Repository は、サーバーレスアプリケーションをパッケージ化し、他のユーザーと共有できる機能を提供する。  
これにより、組織内やコミュニティで再利用可能なサーバーレスコンポーネントを共有できる。

## 2.2 検索可能なリポジトリ

Serverless Application Repository は、公開されているサーバーレスアプリケーションを検索できる。  
キーワード、カテゴリ、発行者などでフィルタリングできる。

## 2.3 簡単なデプロイ

Serverless Application Repository に公開されたアプリケーションを、AWS コンソールや AWS CLI を使用して簡単にデプロイできる。  
これにより、サーバーレスアプリケーションのデプロイプロセスを簡素化できる。

## 2.4 バージョン管理

サーバーレスアプリケーションのバージョン管理をサポートしている。  
これにより、異なるバージョンのアプリケーションを管理し、必要に応じて以前のバージョンにロールバックできる。

## 2.5 SAM (Serverless Application Model) のサポート

AWS Serverless Application Model (SAM) を使用して定義されたサーバーレスアプリケーションをサポートしている。  
これにより、SAM テンプレートを使用して、サーバーレスアプリケーションを簡単にパッケージ化し、デプロイできる。

## 2.6 アクセス制御

AWS IAM を利用して、Serverless Application Repository へのアクセスを制御し、権限を管理できる。  
これにより、アプリケーションの公開やデプロイを特定のユーザーやグループに制限できる。

## 2.7 セキュリティ

Serverless Application Repository は、アプリケーションの暗号化、アクセス制御に対応し、安全なサーバーレスアプリケーションの共有を保証する。  
IAM によるアクセス制御、保存中のデータを暗号化をサポートしている。

- **IAM 連携**: AWS IAM を使用してアクセス制御と権限管理。
- **データ暗号化**: 保存中のデータを暗号化。

## 2.8 統合性

Serverless Application Repository は、AWS の他のサービス（AWS Lambda, AWS SAM, AWS CloudFormation など）と統合されており、サーバーレスアプリケーションの開発、デプロイ、管理を効率的に行える。  
AWS Serverless Application Model (SAM) を利用して、簡単にアプリケーションを公開できる。

## 3. アーキテクチャおよび技術要素

1. 開発者は、AWS SAM または AWS コンソールを使用して、サーバーレスアプリケーションをパッケージ化。
2. パッケージ化されたアプリケーションを、Serverless Application Repository に公開。
3. 他の開発者は、Serverless Application Repository を検索し、必要なアプリケーションを特定。
4. アプリケーションを AWS コンソールまたは AWS CLI からデプロイ。

Serverless Application Repository は、サーバーレスアプリケーションの共有、検索、デプロイを効率化するフルマネージドサービスである。  
アプリケーションの再利用を促進し、開発プロセスを迅速化する。

## 4. セキュリティと認証・認可

セキュリティは Serverless Application Repository の重要な要素である:

- **IAM によるアクセス制御**: AWS IAM を利用して、リポジトリへのアクセスを制御し、権限を管理。
- **データ暗号化**: 保存中のアプリケーションを暗号化し、データの機密性を保護。
- **監査ログ**: AWS CloudTrail を利用して、API 呼び出しやリソース変更を記録。

これにより、アプリケーションの安全な共有と利用を確保できる。

## 5. 料金形態

AWS Serverless Application Repository 自体の利用に料金はかかりない。  
ただし、リポジトリに公開されたアプリケーションで使用される AWS サービス（Lambda 関数、API Gateway など）の利用料金が発生する。

- **アプリケーションデプロイ**: アプリケーションが使用する AWS サービスの使用量に応じた課金。

## 6. よくあるアーキテクチャ・設計パターン

一般的なパターンは以下の通りである:

- **組織内でのサーバーレスコンポーネントの共有**: 組織内で再利用可能な Lambda 関数や API Gateway を Serverless Application Repository で共有。
- **再利用可能なサーバーレスアプリケーションの公開**: 一般的なサーバーレスアプリケーションを公開し、他の開発者が簡単にデプロイできるようにする。
- **コミュニティでのサーバーレスソリューションの共有**: オープンソースのサーバーレスソリューションを公開し、コミュニティで共有、改善。
- **マイクロサービスのデプロイ**: マイクロサービスをサーバーレスアプリケーションとして定義し、Serverless Application Repository で共有。
- **API の共有**: API Gateway を介して公開された API を、Serverless Application Repository で共有し、再利用性を高める。

## 7. 設定・デプロイ手順（ハンズオン例）

1. AWS SAM または AWS コンソールを使用して、サーバーレスアプリケーションをパッケージ化。
2. Serverless Application Repository にアプリケーションを公開。
3. 他の AWS アカウントから公開されたアプリケーションを検索。
4. アプリケーションをデプロイし、設定をカスタマイズ。
5. デプロイされたアプリケーションの動作を確認。

## 8. 試験で問われやすいポイント

## 8.1 サーバーレスアプリケーションの共有

- **パッケージ化**: サーバーレスアプリケーションをパッケージ化して共有できることを理解。
- **再利用性**: 再利用可能なサーバーレスコンポーネントを共有できることを理解。

## 8.2 検索可能なリポジトリ

- **アプリケーション検索**: 公開されたアプリケーションを検索できることを理解。
- **検索フィルタ**: キーワード、カテゴリ、発行者などでフィルタリングできることを理解。

## 8.3 簡単なデプロイ

- **デプロイ手順**: アプリケーションを簡単にデプロイできることを理解。
- **プロセス簡素化**: サーバーレスアプリケーションのデプロイプロセスを簡素化できることを理解。

## 8.4 料金体系

- **サービス利用料金**: Serverless Application Repository 自体の利用は無料であることを理解。
- **関連サービス料金**: アプリケーションで使用される Lambda などの AWS サービスの利用料金が発生することを理解。

## 8.5 類似・関連サービスとの比較

- **AWS CodeArtifact**: パッケージ管理サービス。Serverless Application Repository はサーバーレスアプリケーションに特化。
- **AWS CloudFormation Registry**: リソースタイプの登録と管理。Serverless Application Repository はアプリケーションの共有に特化。

## 8.6 試験で頻出となる具体的な問われ方と答え

- Q: AWS Serverless Application Repository の主な用途は？
  - A: サーバーレスアプリケーションの共有、検索、デプロイを容易にすること。
- Q: Serverless Application Repository で共有できるのは？
  - A: AWS Lambda 関数、API Gateway、DynamoDB テーブルなどサーバーレスリソース。
- Q: Serverless Application Repository でアプリケーションを検索する方法は？
  - A: キーワード、カテゴリ、発行者など。
- Q: Serverless Application Repository でサポートするテンプレートは？
  - A: AWS Serverless Application Model (SAM)。
- Q: Serverless Application Repository のセキュリティ対策は？
  - A: IAM によるアクセス制御、保存時のデータ暗号化など。
- Q: Serverless Application Repository 自体の利用料金は？
  - A: 無料。
- Q: Serverless Application Repository と CodeArtifact の違いは？
  - A: CodeArtifact はパッケージ管理、Serverless Application Repository はサーバーレスアプリケーション共有に特化。
