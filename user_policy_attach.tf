resource "aws_iam_user_policy_attachment" "test-attach" {
  user       = "yinka_ojo"
  policy_arn = "arn:aws:iam::186377153774:policy/zlatan"
}


resource "aws_iam_user_policy_attachment" "user_policy_attach" {
  user       = "sunday_babatunde"
  policy_arn = "arn:aws:iam::186377153774:policy/zlatan"
}