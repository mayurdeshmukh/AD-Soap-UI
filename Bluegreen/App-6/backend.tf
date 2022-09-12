terraform {
  backend "s3" {
    bucket = "jd-soap-ui-bucket"
    key    = "bluegreen-app6/terraform.tfstate"
    region = "us-west-2"
  }
}
