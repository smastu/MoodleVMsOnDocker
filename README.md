# MoodleVMsOnDocker

Dockerを使用してMoodleの開発環境を簡単に構築するためのプロジェクトです。

## 目次

- [前提条件](#前提条件)
- [インストール手順](#インストール手順)
- [SSL証明書の設定](#ssl証明書の設定)
- [使用方法](#使用方法)
- [トラブルシューティング](#トラブルシューティング)

## 前提条件

以下のソフトウェアがインストールされていることを確認してください：

- Docker
- Docker Compose
- Git
- mkcert (SSL証明書の生成用)

## インストール手順

1. リポジトリをクローンします：
```bash
git clone https://github.com/yourusername/MoodleVMsOnDocker.git
cd MoodleVMsOnDocker
```

2. 環境変数ファイルを作成します：
```bash
cp .env.example .env
```

3. `.env`ファイルを編集し、必要な設定を行います。

4. Dockerコンテナを起動します：
```bash
docker-compose up -d
```

## SSL証明書の設定

ローカル環境で HTTPS を有効にするには、mkcertを使用して有効なSSL証明書を生成します。

### mkcertのインストール

#### Linux の場合
```bash
snap install mkcert
```

#### macOSの場合
```bash
brew install mkcert nss
```

#### Windows の場合
https://github.com/FiloSottile/mkcertから対応するバイナリをダウンロードし、インストール手順に従ってください。

### 証明書の生成と設定

1. 信頼されたルート証明書をインストールします：
```bash
mkcert -install
```

2. localhost用の証明書を生成します：
```bash
mkcert localhost
```

3. 生成された証明書ファイルをプロジェクト内の適切なディレクトリに配置します：
```bash
mkdir -p ./application/ssl
mv localhost.pem localhost-key.pem ./application/ssl/
```

## 使用方法

1. ブラウザで以下のURLにアクセスします：
   - HTTP: http://localhost:8080
   - HTTPS: https://localhost:8443

2. 初期設定画面が表示されたら、指示に従ってMoodleの設定を行います。

## トラブルシューティング

### よくある問題と解決方法

1. **コンテナが起動しない場合**
   - Dockerのログを確認：
   ```bash
   docker-compose logs
   ```
   - ポートの競合がないか確認：
   ```bash
   lsof -i :8080
   lsof -i :8443
   ```

2. **SSL証明書のエラー**
   - 証明書が正しく配置されているか確認
   - ブラウザのキャッシュをクリア
   - mkcertの再インストール

3. **データベース接続エラー**
   - 環境変数の設定を確認
   - データベースコンテナの状態を確認：
   ```bash
   docker-compose ps
   ```

## ライセンス

このプロジェクトはMITライセンスの下で公開されています。詳細は[LICENSE](LICENSE)ファイルを参照してください。
