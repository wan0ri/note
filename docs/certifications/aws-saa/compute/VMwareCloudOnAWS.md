---
title: VMware Cloud on AWS
---

## 1. サービス概要

VMware Cloud on AWS は、AWS が提供するサービスで、AWS クラウド上で VMware のソフトウェア定義データセンター (SDDC) を実行できるハイブリッドクラウドソリューションである。  
このサービスを利用することで、既存のオンプレミス VMware 環境を AWS に拡張し、アプリケーションの移行、拡張、保護を容易に行うことができる。  
VMware Cloud on AWS は、VMware vSphere, vSAN, NSX, vCenter Server といった VMware の主要コンポーネントで構成されている。

主なユースケースとして、

- オンプレミス環境からのクラウド移行
- 災害復旧
- アプリケーションの拡張
- ハイブリッドクラウド環境の構築
- データセンターの統合

などが挙げられる。

## 2. 主な特徴と機能

## 2.1 VMware SDDC on AWS

VMware Cloud on AWS は、AWS 上で VMware のソフトウェア定義データセンター (SDDC) を実行できる唯一のサービスである。  
これにより、既存の VMware 環境との互換性を維持しながら、AWS の柔軟性とスケーラビリティを活用できる。

## 2.2 ハイブリッドクラウド環境

オンプレミス VMware 環境と AWS 上の VMware Cloud on AWS をシームレスに接続し、ハイブリッドクラウド環境を構築できる。  
これにより、アプリケーションの移行やデータ転送を容易に行える。

## 2.3 既存の VMware スキルの活用

VMware vSphere, vSAN, NSX, vCenter Server などの既存の VMware スキルをそのまま活用できる。  
新しい技術を習得する必要がなく、運用管理を効率的に行える。

## 2.4 柔軟なリソーススケーリング

vSphere クラスタ内のホスト数を柔軟に増減できる。  
これにより、リソース需要の変化に対応し、必要なリソースだけを効率的に利用できる。

## 2.5 災害復旧 (DR)

オンプレミス VMware 環境の災害復旧先として、VMware Cloud on AWS を利用できる。  
これにより、事業継続性を確保できる。

## 2.6 幅広い AWS サービスとの統合

VMware Cloud on AWS は、Amazon S3, Amazon RDS, Amazon DynamoDB, AWS Lambda など、様々な AWS サービスと統合できる。  
これにより、AWS の豊富なサービスを活用したハイブリッドアプリケーションを構築できる。

## 2.7 セキュリティ

VMware Cloud on AWS は、VMware のセキュリティ機能と AWS のセキュリティ機能を組み合わせ、安全なハイブリッドクラウド環境を構築する。  
AWS IAM によるアクセス制御、データ暗号化、VPC 内でのプライベート接続をサポートしている。

- **IAM 連携**: AWS IAM を使用してアクセス制御と権限管理。
- **データ暗号化**: 転送中および保存中のデータを暗号化。
- **VPC サポート**: Amazon VPC 内でのプライベート接続。

## 2.8 統合性

VMware Cloud on AWS は、VMware vCenter Server、AWS Management Console、AWS CLI など、様々な管理ツールと統合されており、環境の監視、設定、管理を効率的に行うことができる。  
AWS Direct Connect と連携して、オンプレミス環境から高速かつ安全な接続を確立できる。

## 3. アーキテクチャおよび技術要素

1. VMware SDDC は、AWS のベアメタルサーバー上に展開。
2. vSphere、vSAN、NSX、vCenter Server などの VMware コンポーネントで構成。
3. オンプレミス VMware 環境と AWS 上の VMware SDDC は、AWS Direct Connect または VPN で接続。
4. AWS サービスは、VPC エンドポイントまたは Direct Connect 経由で、VMware SDDC にアクセス。

VMware Cloud on AWS は、AWS のインフラストラクチャ上に VMware SDDC を構築し、ハイブリッドクラウド環境をサポートする。  
既存の VMware 環境を AWS に拡張し、シームレスな運用を実現する。

## 4. セキュリティと認証・認可

セキュリティは VMware Cloud on AWS の重要な要素である:

- **IAM によるアクセス制御**: AWS IAM を利用して、VMware Cloud on AWS リソースへのアクセスを制御し、権限を管理。
- **データ暗号化**: 転送中および保存中のデータを暗号化し、データの機密性を保護。
- **VPC サポート**: Amazon VPC 内で VMware Cloud on AWS を使用する場合、プライベート接続を確立。
- **VMware セキュリティ機能**: VMware NSX によるマイクロセグメンテーションなどを利用。
- **監査ログ**: AWS CloudTrail を利用して、API 呼び出しやリソース変更を記録。

これにより、データの安全性とコンプライアンスを確保できる。

## 5. 料金形態

VMware Cloud on AWS の料金は主に以下に基づきる:

- **ホスト時間**: VMware SDDC で使用するホストの実行時間に応じた課金。
- **ストレージ**: VMware vSAN で使用するストレージ量に応じた課金。
- **ネットワーク**: データ転送量に応じた課金。
- **ソフトウェアライセンス**: VMware ソフトウェアライセンスの利用料金。

## 6. よくあるアーキテクチャ・設計パターン

一般的なパターンは以下の通りである:

- **オンプレミス環境からのクラウド移行**: 既存のオンプレミス VMware 環境を AWS に移行し、クラウドのメリットを享受。
- **災害復旧**: オンプレミス VMware 環境の災害復旧先として、VMware Cloud on AWS を利用し、事業継続性を確保。
- **アプリケーションの拡張**: オンプレミスのリソースが不足した場合に、VMware Cloud on AWS のリソースを利用してアプリケーションを拡張。
- **ハイブリッドクラウド環境の構築**: オンプレミスと AWS の両方にまたがるアプリケーションをシームレスに連携させるハイブリッドクラウド環境を構築。
- **データセンターの統合**: 複数のオンプレミスデータセンターを VMware Cloud on AWS に統合し、運用管理を効率化。

## 7. 設定・デプロイ手順（ハンズオン例）

1. AWS コンソールで VMware Cloud on AWS の SDDC を作成。
2. オンプレミス VMware 環境と VMware Cloud on AWS の接続を構成。
3. VMware vCenter Server を使用して、VMware Cloud on AWS の仮想マシンを管理。
4. AWS サービスと VMware SDDC の連携を構成。
5. VMware Cloud on AWS のパフォーマンスとセキュリティを監視。

## 8. 試験で問われやすいポイント

## 8.1 VMware SDDC on AWS

- **VMware SDDC**: AWS 上で VMware のソフトウェア定義データセンターを実行できることを理解。
- **互換性維持**: 既存の VMware 環境との互換性を維持できることを理解。

## 8.2 ハイブリッドクラウド環境

- **シームレスな接続**: オンプレミス VMware 環境と AWS 上の VMware Cloud on AWS をシームレスに接続できることを理解。
- **アプリケーション移行**: アプリケーションの移行やデータ転送が容易になることを理解。

## 8.3 既存の VMware スキル

- **スキル活用**: vSphere, vSAN, NSX, vCenter Server などの既存の VMware スキルをそのまま活用できることを理解。
- **運用効率化**: 新しい技術を習得する必要がなく、運用管理を効率的に行えることを理解。

## 8.4 料金体系

- **ホスト時間**: ホストの実行時間に応じた課金を理解。
- **ストレージ**: VMware vSAN で使用するストレージ量に応じた課金を理解。
- **ネットワーク**: データ転送量に応じた課金を理解。
- **ソフトウェアライセンス**: VMware ソフトウェアライセンスの利用料金が発生することを理解。

## 8.5 類似・関連サービスとの比較

- **AWS Outposts**: AWS のインフラストラクチャをオンプレミス環境に拡張するサービス。VMware Cloud on AWS は VMware 環境を AWS に拡張。
- **Amazon EC2**: AWS の仮想サーバーサービス。VMware Cloud on AWS は VMware 環境を AWS に提供。

## 8.6 試験で頻出となる具体的な問われ方と答え

- Q: VMware Cloud on AWS の主な用途は？
  - A: VMware 環境を AWS に拡張し、ハイブリッドクラウド環境を構築すること。
- Q: VMware Cloud on AWS で利用できる VMware コンポーネントは？
  - A: vSphere, vSAN, NSX, vCenter Server。
- Q: VMware Cloud on AWS で既存のスキルを活用できる？
  - A: はい、既存の VMware スキルをそのまま活用可能。
- Q: VMware Cloud on AWS はどのような環境とシームレスに接続できる？
  - A: オンプレミス VMware 環境。
- Q: VMware Cloud on AWS のセキュリティ対策は？
  - A: IAM によるアクセス制御、データ暗号化、VPC サポートなど。
- Q: VMware Cloud on AWS の料金体系は？
  - A: ホスト時間、ストレージ、ネットワーク、ソフトウェアライセンスに基づいた課金。
- Q: VMware Cloud on AWS と AWS Outposts の違いは？
  - A: Outposts は AWS のインフラをオンプレミスに拡張、VMware Cloud on AWS は VMware 環境を AWS に拡張。
