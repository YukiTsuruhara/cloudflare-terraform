# プロジェクトの構築手順
事前にリポジトリのcloneをお願いします

## terraformのインストール
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
1. terraform.tfvarsファイルを作成する
2. 変数を定義する

   ```shell
   cloudflare_email      = ""
   cloudflare_api_key    = ""
   cloudflare_account_id = ""
   pages_name            = ""
   github_owner          = ""
   github_repository     = ""
   ```
   - cloudflare_email：アカウントのEメールアドレス
   - cloudflare_api_key：アカウントのAPI Key
   - cloudflare_account_id：アカウントID
   - pages_name：サービスのプロジェクト名
   - github_owner：githubのオーナー名
   - github_repository：リポジトリ名  

   アカウントに関する情報はDashBoardから確認できます。

3. .gitignoreに変数ファイルを記載
   ```shell
   # 変数は管理しない
   terraform.tfvars
   ```

## プロジェクトの構築

# cloudflare-terraform
