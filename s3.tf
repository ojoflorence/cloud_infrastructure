resource "aws_s3_bucket" "eloshiren-bucket" {
  bucket = "our-eloshiren-test-bucket"

  tags = {
    Name        = "My-eloshiren"
    Environment = "Dev"
  }
}