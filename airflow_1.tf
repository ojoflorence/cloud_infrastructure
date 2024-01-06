resource "aws_iam_user" "airflow_1_user" {
  name = "airflow-1-app"
}

resource "aws_iam_policy" "airflow_1_policy" {
  name        = "airflow-1-app-policy"
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

resource "aws_iam_user_policy_attachment" "test-policy-attach" {
  user       = aws_iam_user.airflow_1_user.id
  policy_arn = aws_iam_policy.airflow_1_policy.arn
}

resource "aws_iam_access_key" "airflow_1_access_key" {
  user    = aws_iam_user.airflow_1_user.name
}


resource "aws_ssm_parameter" "airflow_1_access_key" {
  name  = "airflow_1_access_key"
  type  = "String"
  value = aws_iam_access_key.airflow_1_access_key.id
}

resource "aws_ssm_parameter" "airfloww_1_access_key" {
  name  = "airflow_1_secret_key"
  type  = "String"
  value = aws_iam_access_key.airflow_1_access_key.secret
}
