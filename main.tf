terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

provider "cloudflare" {
  email     = var.cloudflare_email
  api_token = var.cloudflare_api_token
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
    build_command   = var.build_command
    destination_dir = var.destination_dir
    root_dir        = var.root_dir
  }

  deployment_configs {
    preview {
      environment_variables = {
        for_each : { for k, v in var.preview_env : k => v }
      }

      compatibility_date  = "2024-07-30"
      compatibility_flags = ["nodejs_compat"]
    }
    production {
      environment_variables = {
        for_each : { for k, v in var.production_env : k => v }
      }

      compatibility_date  = "2024-07-30"
      compatibility_flags = ["nodejs_compat"]
    }
  }
}
