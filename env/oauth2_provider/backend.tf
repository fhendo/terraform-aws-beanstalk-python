terraform {
  backend "s3" {
    bucket = "fhendo-terraform-state"
    key    = "oauth2_provider/terraform.tfstate"
    region = "sa-east-1"
  }
}
