# プロジェクトの構築手順

事前にリポジトリの clone

## terraform のインストール

- macOS  
  [Homebrew](https://brew.sh/ja/)がインストール済みであることが前提

  ```shell
  brew tap hashicorp/tap
  brew install hashicorp/tap/terraform
  ```

- Binary download
  - macOS
    - https://releases.hashicorp.com/terraform/1.9.3/terraform_1.9.3_darwin_amd64.zip
    - https://releases.hashicorp.com/terraform/1.9.3/terraform_1.9.3_darwin_arm64.zip
  - Windows
    - https://releases.hashicorp.com/terraform/1.9.3/terraform_1.9.3_windows_386.zip
    - https://releases.hashicorp.com/terraform/1.9.3/terraform_1.9.3_windows_amd64.zip
- その他
  - [Install Terraform](https://developer.hashicorp.com/terraform/install)こちらを参照ください

## 変数ファイルを定義

1. terraform.tfvars ファイルを作成する
2. 変数を定義する

   ```shell
   cloudflare_api_token  = ""
   cloudflare_account_id = ""
   pages_name            = ""
   github_owner          = ""
   github_repository     = ""
   preview_branch        = "develop"
   production_branch     = "main"
   build_command         = ""
   destination_dir       = ""
   root_dir              = ""
   preview_env = {}
   production_env = {}
   ```
   - cloudflare_api_token：アカウントの API Token
   - cloudflare_account_id：アカウント ID
   - pages_name：サービスのプロジェクト名
   - github_owner：github のオーナー名
   - github_repository：リポジトリ名
   - preview_branch：開発環境のブランチ
   - production_branch：本番環境のブランチ
   - build_command：ビルドコマンド
   - destination_dir：ビルド出力ディレクトリ
   - root_dir：ルートディレクトリ
   - preview_env：開発環境の変数
   - production_env：本番環境の変数

   ### API Tokenの作成
   terraformでpagesプロジェクトを作成するために許可が必要になる  
   作成方法は[ドキュメント参照](https://leihauoli.atlassian.net/wiki/x/NYAogw)

   ### Next.jsのビルドコマンド・出力ディレクトリ
   ```shell
   // ビルド用パッケージのインストール
   npm install -D @cloudflare/next-on-pages

   // build command
   npx @cloudflare/next-on-pages@1

   // destination_dir
   .vercel/output/static
   ```
   フレームワークごと設定が必要 -> [ドキュメント参照](https://developers.cloudflare.com/pages/framework-guides/)

3. .gitignore に変数ファイルを記載
   ```shell
   terraform.tfvars
   terraform.tfstate
   terraform.tfstate.backup
   ```

## Githubと連携
- [詳しくはConfluenceを参照](https://leihauoli.atlassian.net/wiki/x/EoAogw)

## プロジェクトの構築
1. プロジェクトの初期化

   ```shell
   terraform init
   ```
2. 作成されるリソースの確認

   ```shell
   terraform plan -var-file=terraform.tfvars
   ```

3. プロジェクトの作成

   ```shell
   terraform apply -var-file=terraform.tfvars
   ```