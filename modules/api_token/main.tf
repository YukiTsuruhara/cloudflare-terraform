data "cloudflare_api_token_permission_groups" "all" {}

resource "cloudflare_api_token" "token" {
  name = var.token_name

  policy {
    permission_groups = [
        "data.cloudflare_api_token_permission_groups.all.account.${var.permission_name}"
    ]
    resources = {
      "com.cloudflare.api.account.${var.cloudflare_account_id}" = "*"
    }
  }
}