resource "aws_iam_policy" "policy" {
  name        = "zlatan"
  path        = "/"
  description = "This is a custome policy for the class"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:*Object*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}