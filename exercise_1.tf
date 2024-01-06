resource "aws_iam_group" "our_eloshiren" {
  name = "the-eloshiren"
  
}

resource "aws_iam_user" "my_eloshiren" {
  name = "eloshiren-1"
  
}

resource "aws_iam_policy" "our-eloshiren-policy" {
  name        = "the_eloshiren_policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_group_policy_attachment" "eloshiren-policy-attach" {
  group      = aws_iam_group.our_eloshiren.name
  policy_arn = aws_iam_policy.our-eloshiren-policy.arn
}

resource "aws_iam_user_group_membership" "eloshiren-group" {
  user = aws_iam_user.my_eloshiren.name

  groups = [
    aws_iam_group.our_eloshiren.name

  ]
}

resource "aws_iam_access_key" "the-eloshiren-access-key" {
  user    = aws_iam_user.my_eloshiren.name
  
}

resource "aws_ssm_parameter" "the_eloshiren_access_key" {
  name  = "the_eloshiren_access_key"
  type  = "String"
  value = aws_iam_access_key.the-eloshiren-access-key.id
}

resource "aws_ssm_parameter" "the_eloshirenn_access_key" {
  name  = "the_eloshiren_secret_key"
  type  = "String"
  value = aws_iam_access_key.the-eloshiren-access-key.secret
}

