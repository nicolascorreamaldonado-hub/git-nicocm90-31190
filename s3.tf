resource "aws_s3_bucket" "cl_data_test" {
  bucket = local.s3-sufix

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}