variable "region" {
  description = "The AWS region to deploy to"
  default = "us-east-1"
}

variable "bucket_name" {
  description = "The name of the S3 bucket for Terraform states"
  default = "rs-school-s3"
}
