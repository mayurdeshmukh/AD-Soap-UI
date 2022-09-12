terraform {
  backend "s3" {
    bucket = "jd-soap-ui-bucket"
    key    = "bluegreen-app2/terraform.tfstate"
    region = "us-west-2"
  }
}
