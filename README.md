a mkcertを使用したSSL証明書の設定

ローカル環境で HTTPS を有効にするには、有効な SSL 証明書を生成するためのシンプルで効率的なツールであるmkcert を 使用します。次の手順に従ってください。

mkcertをインストールする

Linux の場合:mkcertのようなパッケージ マネージャーを使用してインストールするsnapか、ソースからコンパイルすることができます。

snap install mkcert

macOSの場合: Homebrewを使用してインストールします

brew install mkcert nss

Windows の場合: https://github.com/FiloSottile/mkcertから対応するバイナリをダウンロードし、インストール手順に従います。

b.信頼されたルート証明書をインストールする

証明書を生成する前に、信頼できるルート証明書をシステムにインストールする必要があります。次のコマンドを実行します。

mkcert -install

このコマンドは、オペレーティング システムにルート証明書をインストールします。これにより、Web ブラウザーは によって生成された証明書をmkcert有効なものとして認識できるようになります。

localhost の証明書を生成します

mkcert localhost

これにより、次の 2 つのファイルが作成されます。

localhost.pem: 公開証明書。
localhost-key.pem: 秘密鍵。

これらのファイルをプロジェクト内のディレクトリに保存します。
./application/ssl