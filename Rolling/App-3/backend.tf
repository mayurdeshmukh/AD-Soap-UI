terraform {
  backend "s3" {
    bucket = "jd-soap-ui-bucket"
    key    = "app3/terraform.tfstate"
    region = "us-west-2"
  }
}
