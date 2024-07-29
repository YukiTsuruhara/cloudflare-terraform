terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

provider "cloudflare" {
  email   = var.cloudflare_email
  api_key = var.cloudflare_api_key
}

resource "cloudflare_pages_project" "pages" {
  account_id        = var.cloudflare_account_id
  name              = var.pages_name
  production_branch = var.production_branch

  source {
    type = "github"
    config {
      owner                         = var.github_owner
      repo_name                     = var.github_repository
      production_branch             = var.production_branch
      pr_comments_enabled           = true
      deployments_enabled           = true
      production_deployment_enabled = true
      preview_deployment_setting    = "custom"
      preview_branch_includes       = [var.preview_branch]
      preview_branch_excludes       = [var.production_branch]
    }
  }

  build_config {
    build_command   = "npm run build"
    destination_dir = "build"
    root_dir        = ""
  }
}