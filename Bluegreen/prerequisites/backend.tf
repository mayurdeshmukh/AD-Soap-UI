terraform {
  backend "s3" {
    bucket = "jd-soap-ui-bucket"
    key    = "bluegreen-loadbalancer/terraform.tfstate"
    region = "us-west-2"
  }
}
