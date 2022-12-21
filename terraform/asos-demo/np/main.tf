module "demo" {
  source            = "../modules/"
  stage             = var.stage
  location          = var.location
  environment       = var.environment
  environment_short = var.environment_short
  location_short    = var.location_short
}
