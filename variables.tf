variable "cloudflare_email" {
  description = "アカウントのEメールアドレス"
  type        = string
}

variable "cloudflare_api_key" {
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
  default = "develop"
}

variable "production_branch" {
  description = "本番ブランチ名"
  type        = string
  default = "main"
}
