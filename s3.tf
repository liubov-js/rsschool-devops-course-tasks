resource "aws_s3_bucket" "rs-school-s3" {
   bucket = var.bucket_name
   acl = "private"  

   versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name = "Terraform states bucket"
  }
}
