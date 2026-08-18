data "aws_iam_policy_document" "instance_profile" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "instance_profile" {
  name               = "${var.project_name}-instance-role"
  assume_role_policy = data.aws_iam_policy_document.instance_profile.json
}

resource "aws_iam_role_policy_attachment" "instance_profile" {
  count      = length(var.policy_arns)
  role       = aws_iam_role.instance_profile.name
  policy_arn = var.policy_arns[count.index]
}
resource "aws_iam_instance_profile" "this" {
  name = "${var.project_name}-instance-profile"
  role = aws_iam_role.instance_profile.name
}
