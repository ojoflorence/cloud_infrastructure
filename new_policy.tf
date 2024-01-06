resource "aws_iam_policy" "data-hub-policy" {
  name        = "data-hub-glue-policy"
  path        = "/"
  description = "policy for our data class"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "glue:*Database*",
          "glue:*Get*"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_group_policy_attachment" "data-hub-attachment" {
  group      = "data_engineering_hub"
  policy_arn = aws_iam_policy.data-hub-policy.arn
}