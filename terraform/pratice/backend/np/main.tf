

module "backend_kms"  {
    source            = "../modules/kms/"
    stage             = var.stage
    stage_short       = var.stage_short
    location          = var.location
    environment       = var.environment
    environment_short = var.environment_short
    location_short    = var.location_short
    location_concat   = var.location_concat

}
module "backend_s3"  {
  source            = "../modules/s3/"
    stage             = var.stage
    stage_short       = var.stage_short
    location          = var.location
    environment       = var.environment
    environment_short = var.environment_short
    location_short    = var.location_short
    location_concat   = var.location_concat
}
module "backend_rg"  {
  source            = "../modules/resourceGroup"
    stage             = var.stage
    stage_short       = var.stage_short
    location          = var.location
    environment       = var.environment
    environment_short = var.environment_short
    location_short    = var.location_short
    location_concat   = var.location_concat
}
# module "dynomodb"  {
#   source            = "../modules/dynomodb/"
# }

