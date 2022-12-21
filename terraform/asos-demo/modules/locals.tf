locals {
  tags = {
    stage                  = var.stage
    environment            = var.environment
    location               = var.location
    team                   = "glitter kittens"
    managed                = "by terraform"
    deployment             = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
  }
  account_tier = var.environment == "NonProd" ? "Standard" : "Premium"  
}
