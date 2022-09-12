terraform {
  backend "s3" {
    bucket = "jd-soap-ui-bucket"
    key    = "app1/terraform.tfstate"
    region = "us-west-2"
  }
}
