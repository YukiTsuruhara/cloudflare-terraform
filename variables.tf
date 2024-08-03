variable "cloudflare_email" {
  description = "アカウントのEメールアドレス"
  type        = string
}

variable "cloudflare_api_token" {
  description = "アカウントのAPIキー"
  type        = string
}

variable "cloudflare_account_id" {
  description = "アカウントID"
  type        = string
}

variable "pages_name" {
  description = "Cloudflare Pagesのプロジェクト名"
  type        = string
}

variable "github_owner" {
  description = "GitHubのリポジトリのオーナー名"
  type        = string
}

variable "github_repository" {
  description = "GitHubのリポジトリ名"
  type        = string
}

variable "preview_branch" {
  description = "プレビューブランチ名"
  type        = string
}

variable "production_branch" {
  description = "本番ブランチ名"
  type        = string
}

variable "build_command" {
  description = "ビルドコマンド"
  type        = string
}

variable "destination_dir" {
  description = "ビルド後のディレクトリ"
  type        = string
}

variable "root_dir" {
  description = "ビルド元のディレクトリ"
  type        = string
}

variable "preview_env" {
  description = "プレビュー環境の環境変数"
  type        = map(string)
}

variable "production_env" {
  description = "本番環境の環境変数"
  type        = map(string)
}
