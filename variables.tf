variable "cloudflare_email" {
  type        = string
  description = "アカウントのメールアドレス"
}

variable "cloudflare_api_token" {
  type        = string
  description = "アカウントのAPIキー"
}

variable "cloudflare_account_id" {
  type        = string
  description = "アカウントID"
}

variable "pages_name" {
  type        = string
  description = "Cloudflare Pagesのプロジェクト名"
}

variable "github_owner" {
  type        = string
  description = "GitHubのリポジトリのオーナー名"
}

variable "github_repository" {
  type        = string
  description = "GitHubのリポジトリ名"
}

variable "preview_branch" {
  type        = string
  description = "プレビューブランチ名"
}

variable "production_branch" {
  type        = string
  description = "本番ブランチ名"
}

variable "build_command" {
  type        = string
  description = "ビルドコマンド"
}

variable "destination_dir" {
  type        = string
  description = "ビルド後のディレクトリ"
}

variable "root_dir" {
  type        = string
  description = "ビルド元のディレクトリ"
}

variable "preview_env" {
  type        = map(string)
  description = "プレビュー環境の環境変数"
  default = {
    "ENV" = "develop"
  }
}

variable "production_env" {
  type        = map(string)
  description = "本番環境の環境変数"
  default = {
    "ENV" = "production"
  }
}
