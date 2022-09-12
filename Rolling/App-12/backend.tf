terraform {
  backend "s3" {
    bucket = "jd-soap-ui-bucket"
    key    = "app2/terraform.tfstate"
    region = "us-west-2"
  }
}
