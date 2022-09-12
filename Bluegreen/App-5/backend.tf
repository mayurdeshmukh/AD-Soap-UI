terraform {
  backend "s3" {
    bucket = "jd-soap-ui-bucket"
    key    = "bluegreen-app5/terraform.tfstate"
    region = "us-west-2"
  }
}
