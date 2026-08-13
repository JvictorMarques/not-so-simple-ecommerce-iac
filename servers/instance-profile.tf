data "aws_iam_policy_document" "this" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "this" {
  name               = "${var.project_name}-instance-role"
  assume_role_policy = data.aws_iam_policy_document.this.json
}

resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
resource "aws_iam_instance_profile" "this" {
  name = "${var.project_name}-instance-profile"
  role = aws_iam_role.this.name
}
