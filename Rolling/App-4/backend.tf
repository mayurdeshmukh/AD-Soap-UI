terraform {
  backend "s3" {
    bucket = "jd-soap-ui-bucket"
    key    = "app4/terraform.tfstate"
    region = "us-west-2"
  }
}
