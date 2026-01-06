---
title: AWS Directory Service
---

## 1. サービス概要

AWS Directory Service は、AWS クラウド環境で、Microsoft Active Directory (AD) やその他のディレクトリサービスを簡単に利用できるようにするサービスである。  
ユーザーは、既存の AD 環境を AWS クラウドに拡張したり、AWS Managed Microsoft AD のようなフルマネージドの AD を新たに作成したりできる。  
これにより、ユーザー認証、アクセス制御、グループポリシーなどを集中管理し、AWS 環境とオンプレミス環境の連携を容易にできる。

主なユースケースとして、

- EC2 インスタンスのドメイン参加
- WorkSpaces のユーザー管理
- Amazon RDS for SQL Server の認証
- Windows ベースアプリケーションの認証・認可
- SharePoint などのエンタープライズアプリケーションの利用

などが挙げられます。  
AWS Directory Service は、これらのユースケースに対応するための様々な機能と、AWS の他のサービスとの統合を提供する。

## 2. 主な特徴と機能

### 2.1 AWS Managed Microsoft AD

AWS が管理するフルマネージドの Microsoft Active Directory を提供する。  
ユーザーは、AD インフラの構築や管理を行うことなく、AD の機能を利用できる。

### 2.2 AD Connector

既存のオンプレミス AD と AWS 環境を接続するためのプロキシとして機能する。  
ユーザーは、オンプレミスの AD 認証情報を利用して、AWS リソースにアクセスできる。

### 2.3 Simple AD

AWS クラウド環境で、シンプルなスタンドアロンの AD を提供する。  
ユーザーは、小規模な環境や開発環境で、AD 機能を簡単に利用できる。

### 2.4 AD 対応アプリケーションの利用

AD に対応した様々な AWS サービス（例：WorkSpaces, Amazon RDS for SQL Server など）やアプリケーションを、AD 環境で利用できる。  
これにより、既存の AD 環境を AWS クラウドに拡張し、エンタープライズアプリケーションを容易に利用できる。

### 2.5 信頼関係

AWS Managed Microsoft AD とオンプレミス AD との間に、双方向の信頼関係を設定できる。  
これにより、オンプレミスと AWS の両方のリソースに、同じ認証情報でアクセスできる。

### 2.6 グループポリシー

グループポリシーを利用して、ユーザーやコンピューターの設定を集中管理できる。  
これにより、AWS 環境全体で一貫した設定を適用できる。

### 2.7 統合性と拡張性

AWS Directory Service は、Amazon EC2, Amazon RDS, Amazon WorkSpaces, AWS IAM などの AWS の他のサービスと密接に統合されています。  
また、API を利用して、ディレクトリサービスの管理を自動化することもできる。

## 3. アーキテクチャおよび技術要素

1. ユーザーは、AWS Directory Service で AWS Managed Microsoft AD、AD Connector、または Simple AD を作成。
2. EC2 インスタンス、WorkSpaces、RDS などの AWS リソースは、ディレクトリサービスに参加。
3. ユーザーは、ディレクトリサービスで認証を行い、AWS リソースにアクセス。
4. 必要に応じて、オンプレミス AD と AWS Managed Microsoft AD の間で信頼関係を確立。

AWS Directory Service は、AWS のインフラ上に構築されており、高い可用性と信頼性を提供する。  
ディレクトリサービスのプロビジョニングや管理は AWS が行うため、ユーザーはインフラの管理を行う必要はありません。

#### 4. セキュリティと認証・認可

AWS Directory Service は、ディレクトリサービスのセキュリティを確保するために、以下の機能を提供する:

- **IAM 統合**: AWS Identity and Access Management (IAM) を利用して、AWS Directory Service へのアクセスを制御する。
- **VPC 内での実行**: ディレクトリサービスは Virtual Private Cloud (VPC) 内で実行され、ネットワーク隔離を実現。
- **データ暗号化**: データは転送中および保存時に暗号化される。
- **アクセス制御**: IAM ポリシーを通じて、ユーザーやグループごとに、AWS Directory Service の操作権限を詳細に制御できる。
- **監査ログ**: CloudTrail を通じて、AWS Directory Service の利用状況を監査できる。

これらのセキュリティ対策により、ディレクトリサービスとそのデータを安全に保護する。

## 5. 料金形態

AWS Directory Service の料金は主に以下に基づきます:

- **AWS Managed Microsoft AD**: 1 か月あたりに利用した時間に応じた料金と、ストレージ容量に応じた料金。
- **AD Connector**: 接続数に応じた料金。
- **Simple AD**: 1 か月あたりに利用した時間に応じた料金と、ストレージ容量に応じた料金。

## 6. よくあるアーキテクチャ・設計パターン

AWS Directory Service は、様々な AWS 環境で利用できる。  
一般的なパターンは以下の通りです:

- **EC2 インスタンスのドメイン参加**: EC2 インスタンスを AWS Managed Microsoft AD に参加させ、AD 認証を利用。
- **WorkSpaces のユーザー管理**: AWS WorkSpaces のユーザー管理に、AWS Managed Microsoft AD を利用。
- **Amazon RDS for SQL Server の認証**: Amazon RDS for SQL Server の認証に、AWS Managed Microsoft AD を利用。
- **Windows ベースアプリケーションの認証・認可**: Windows ベースのアプリケーションの認証・認可を AD 環境で行う。
- **SharePoint などのエンタープライズアプリケーションの利用**: SharePoint などのエンタープライズアプリケーションを AWS 環境で利用する際に、AD 環境を連携。
- **ハイブリッド環境での認証連携**: オンプレミス AD と AWS Managed Microsoft AD を連携し、ハイブリッド環境全体で認証を統合。

## 7. 設定・デプロイ手順（ハンズオン例）

1. AWS マネジメントコンソールから AWS Directory Service を開き、AWS Managed Microsoft AD、AD Connector、または Simple AD を作成。
2. VPC、サブネット、セキュリティグループなどのネットワーク設定を構成。
3. EC2 インスタンス、WorkSpaces などの AWS リソースをディレクトリサービスに参加。
4. 必要に応じて、オンプレミス AD との信頼関係を設定。
5. AD ユーザーを作成し、AWS リソースへのアクセス権限を付与。
6. AD 認証でリソースにアクセス。

## 8. 試験で問われやすいポイント

### 8.1 AWS Managed Microsoft AD

- **特徴**: AWS が管理するフルマネージドの AD。
- **利点**: AD インフラの管理が不要。
- **試験対策**: フルマネージド AD の利点、利用ケースが問われる。

### 8.2 AD Connector

- **機能**: オンプレミス AD と AWS 環境を接続するプロキシ。
- **利用**: オンプレミス AD 認証情報を利用して AWS リソースにアクセス。
- **試験対策**: AD Connector の役割、利用ケースが問われる。

### 8.3 Simple AD

- **特徴**: AWS クラウド環境でシンプルなスタンドアロン AD を提供。
- **利用**: 小規模な環境や開発環境での AD 利用。
- **試験対策**: Simple AD の利用ケース、Managed AD との違いが問われる。

### 8.4 AD 対応アプリケーションの利用

- **対象**: WorkSpaces、RDS for SQL Server など。
- **目的**: 既存の AD 環境を AWS クラウドに拡張。
- **試験対策**: AD 対応アプリケーションの例、利用方法が問われる。

### 8.5 信頼関係

- **対象**: AWS Managed Microsoft AD とオンプレミス AD。
- **機能**: 双方向の信頼関係を設定。
- **試験対策**: 信頼関係のメリット、設定方法が問われる。

### 8.6 グループポリシー

- **機能**: ユーザーやコンピューターの設定を集中管理。
- **利用**: AWS 環境全体で一貫した設定を適用。
- **試験対策**: グループポリシーの利用目的、メリットが問われる。

### 8.7 料金体系

- **課金対象**: AWS Managed Microsoft AD、AD Connector、Simple AD の利用時間、ストレージ容量。
- **最適化**: 不要なリソースを削減し、利用時間を最適化。
- **試験対策**: 各サービスの料金体系、課金要素が問われる。

### 8.8 類似・関連サービスとの比較

- **AWS IAM**: AWS リソースへのアクセス制御に特化。Directory Service はユーザー認証とディレクトリサービスを提供。
- **AWS Single Sign-On (SSO)**: 複数の AWS アカウントやアプリケーションへのシングルサインオンを提供。Directory Service は認証基盤として利用される。

### 8.9 試験で頻出となる具体的な問われ方と答え

- Q: AWS Directory Service は何を提供するサービスですか？
  - A: AWS クラウド環境で、Microsoft Active Directory (AD) やその他のディレクトリサービスを簡単に利用できるようにするサービスである。
- Q: AWS Directory Service には、どのような種類のディレクトリサービスがあるか？
  - A: AWS Managed Microsoft AD、AD Connector、Simple AD の 3 つの種類がある。
- Q: AWS Managed Microsoft AD は、どのような特徴を持っていますか？
  - A: AWS が管理するフルマネージドの Microsoft Active Directory を提供する。
- Q: AWS Directory Service の AD Connector は、どのような役割を果たするか？
  - A: 既存のオンプレミス AD と AWS 環境を接続するためのプロキシとして機能する。
- Q: AWS Directory Service の料金はどのように計算されるか？
  - A: AWS Managed Microsoft AD、AD Connector、Simple AD の利用時間、ストレージ容量などに基づいて計算される。
