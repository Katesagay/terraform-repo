terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "4.3.2"
    }
  }
}

provider "github" {
  token = "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"
}

resource "github_repository" "terraform-repo" {
  name        = "terraform-repo"
  visibility = "public"


}
# resource "github_repository_file" "foo" {
#   repository          = "terraform-repo"
#   branch              = "main"
#   file                = "terraform-practice/Creating first EC2"
#   content             = "example.tf"
#   commit_message      = "Managed by Terraform"
#   commit_author       = "Kate Sagay"
#   commit_email        = "kate_sagay@hotmail.com"
#   overwrite_on_create = true
# }