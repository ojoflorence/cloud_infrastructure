resource "aws_iam_user" "first_student" {
  name = "yinka_ojo"
  tags = {
    Group      = "data-eng-hub"
    Instructor = "mayowa"
    student    = "amanda"
  }
}
resource "aws_iam_user" "second_student" {
  name = "sunday_babatunde"
  tags = {
    Group      = "data-eng-hub"
    Instructor = "mayowa"
  }
}

resource "aws_iam_user" "third_student" {
  name = "recap22"

  tags = {
    owner = "data_eng_hub"
  }
}