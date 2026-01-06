---
title: Amazon Kinesis
---

## 1. サービス概要

Amazon Kinesis は、リアルタイムのストリーミングデータを収集、処理、分析するためのプラットフォームである。  
ユーザーは、

- ビデオ
- オーディオ
- アプリケーションログ
- Web サイトのクリックストリーム
- IoT デバイスのデータ

など、様々なソースからの大量のデータをリアルタイムに処理し、分析できる。  
Kinesis は、ストリーミングデータの処理、分析、保存を効率的に行うためのスケーラビリティ、可用性、耐久性を提供する。

主なユースケースとして、

- リアルタイムなデータ分析
- アプリケーションログの分析
- IoT データの処理
- Web サイトのクリックストリーム分析
- ストリーミング ETL
- 機械学習のデータ入力

などが挙げられる。  
Amazon Kinesis は、これらのユースケースに対応するための様々な機能と、AWS の他のサービスとの統合を提供する。

## 2. 主な特徴と機能

### 2.1 Kinesis Data Streams

Kinesis Data Streams は、リアルタイムのストリーミングデータを収集、処理するためのサービスである。  
ユーザーは、データをシャード（分割）して並列処理し、高いスループットを実現できる。

### 2.2 Kinesis Data Firehose

Kinesis Data Firehose は、ストリーミングデータを Amazon S3、Amazon Elasticsearch Service、Amazon Redshift などの宛先に自動的に配信するサービスである。  
ユーザーは、データの変換やバッチ処理の設定を簡単に行える。

### 2.3 Kinesis Data Analytics

Kinesis Data Analytics は、ストリーミングデータに対してリアルタイムな分析を実行できるサービスである。  
ユーザーは、SQL や Apache Flink を使って、データの集計、フィルタリング、変換などの処理を定義できる。

### 2.4 マネージドサービス

Kinesis は、フルマネージドサービスであり、インフラストラクチャのプロビジョニングや管理は AWS が行う。  
ユーザーは、データの収集、処理、分析に集中できる。

### 2.5 スケーラビリティ

Kinesis は、データ量やトラフィックの変動に応じて、自動的にスケーリングできる。  
これにより、安定したパフォーマンスを維持できる。

### 2.6 リアルタイム処理

Kinesis は、データをリアルタイムに処理できる。  
これにより、最新のデータに基づいて、迅速な意思決定やアクションが可能になる。

### 2.7 統合性と拡張性

Amazon Kinesis は、Amazon S3, AWS Lambda, Amazon Redshift, Amazon Elasticsearch Service などの AWS の他のサービスと密接に統合されている。  
また、API を利用して、データの収集や処理を自動化することもできる。

## 3. アーキテクチャおよび技術要素

1. データプロデューサーは、Kinesis Data Streams にデータを送信。
2. Kinesis Data Streams は、データをシャードに分散し、保存。
3. Kinesis Data Analytics は、ストリーミングデータに対してリアルタイム分析を実行。
4. Kinesis Data Firehose は、データを S3、Elasticsearch Service、Redshift などの宛先に配信。
5. ダウンストリームのアプリケーションは、処理されたデータを取得。

Amazon Kinesis は、AWS のインフラ上に構築されており、高い可用性とスケーラビリティを提供する。  
データストリームのプロビジョニングや管理は AWS が行うため、ユーザーはインフラの管理を行う必要はない。

## 4. セキュリティと認証・認可

Amazon Kinesis は、データセキュリティを確保するために、以下の機能を提供する:

- **IAM 統合**: AWS Identity and Access Management (IAM) を利用して、Kinesis へのアクセスを制御する。
- **データ暗号化**: データは転送中および保存時に暗号化される。
- **VPC エンドポイント**: VPC 内から Kinesis にアクセスする際に、インターネットを経由せずにアクセスできる。
- **アクセス制御**: IAM ポリシーを通じて、ユーザーやグループごとに、Kinesis の操作権限を詳細に制御できる。
- **監査ログ**: CloudTrail を通じて、Kinesis の利用状況を監査できる。

これらのセキュリティ対策により、ストリーミングデータへの不正アクセスを防止し、機密情報を保護できる。

## 5. 料金形態

Amazon Kinesis の料金は主に以下に基づく:

- **Kinesis Data Streams**: 取り込んだデータ量、実行時間、シャードの数に応じて課金。
- **Kinesis Data Firehose**: 配信されたデータ量、データ変換の実行時間に応じて課金。
- **Kinesis Data Analytics**: 処理されたデータ量、アプリケーションの実行時間に応じて課金。
- **データ転送**: データ転送量に応じて課金。

## 6. よくあるアーキテクチャ・設計パターン

Amazon Kinesis は、様々なストリーミングデータ処理に利用できる。一般的なパターンは以下の通りである:

- **リアルタイムなデータ分析**: リアルタイムでデータストリームを分析し、即座にビジネスインサイトを取得。
- **アプリケーションログの分析**: アプリケーションログを Kinesis で収集し、リアルタイムに分析、監視。
- **IoT データの処理**: IoT デバイスから送信されたデータを Kinesis で収集し、処理。
- **Web サイトのクリックストリーム分析**: Web サイトのクリックストリームデータを収集し、ユーザー行動を分析。
- **ストリーミング ETL**: ストリーミングデータを変換し、他の AWS サービスにロード。
- **機械学習のデータ入力**: 機械学習モデルのトレーニングや推論に利用するストリーミングデータを収集。

## 7. 設定・デプロイ手順（ハンズオン例）

1. AWS マネジメントコンソールから Amazon Kinesis を開き、Kinesis Data Streams を作成。
2. Kinesis Data Firehose を作成し、S3 などの宛先を設定。
3. Kinesis Data Analytics アプリケーションを作成し、SQL または Flink のコードを定義。
4. Kinesis Data Streams にデータを送信。
5. Kinesis Data Firehose でデータを宛先に配信。
6. Kinesis Data Analytics でデータを分析。

## 8. 試験で問われやすいポイント

### 8.1 Kinesis Data Streams

- **機能**: リアルタイムのストリーミングデータを収集、処理。
- **特徴**: データをシャードに分割して並列処理。
- **試験対策**: Data Streams の役割、シャードの概念が問われる。

### 8.2 Kinesis Data Firehose

- **機能**: ストリーミングデータを S3、Elasticsearch Service、Redshift などに自動配信。
- **利用**: データ変換、バッチ処理の設定が可能。
- **試験対策**: Data Firehose の利用方法、配信先が問われる。

### 8.3 Kinesis Data Analytics

- **機能**: ストリーミングデータに対してリアルタイムな分析を実行。
- **利用**: SQL、Apache Flink を使用して、データの集計、フィルタリング、変換。
- **試験対策**: Data Analytics の利用方法、クエリ言語が問われる。

### 8.4 料金体系

- **課金対象**: Data Streams の取り込んだデータ量、実行時間、シャード数、Data Firehose の配信されたデータ量、Data Analytics の処理されたデータ量など。
- **最適化**: 不要なデータ転送の削減、適切なシャード数設定がコスト削減に有効。
- **試験対策**: 各サービスごとの料金体系、課金要素が問われる。

### 8.5 類似・関連サービスとの比較

- **Amazon SQS**: キューサービス。Kinesis はストリーミングデータ処理に特化。
- **Apache Kafka**: 分散ストリーミングプラットフォーム。Kinesis は AWS が提供するフルマネージドサービス。

### 8.6 試験で頻出となる具体的な問われ方と答え

- Q: Amazon Kinesis は何を提供するサービスですか？
  - A: リアルタイムのストリーミングデータを収集、処理、分析するためのプラットフォームである。
- Q: Amazon Kinesis Data Streams は何に使用しますか？
  - A: リアルタイムのストリーミングデータを収集、処理するために使用する。
- Q: Amazon Kinesis Data Firehose は何を提供しますか？
  - A: ストリーミングデータを S3、Elasticsearch Service、Redshift などの宛先に自動的に配信するサービスである。
- Q: Amazon Kinesis Data Analytics では、どのような言語を使ってデータ分析を記述できますか？
  - A: SQL や Apache Flink を使って、データ分析を記述できる。
- Q: Amazon Kinesis の料金はどのように計算されますか？
  - A: Kinesis Data Streams の取り込んだデータ量、実行時間、シャード数、Kinesis Data Firehose の配信されたデータ量、Kinesis Data Analytics の処理されたデータ量などに基づいて計算される。
