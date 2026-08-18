data "aws_iam_policy_document" "sns_trust_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["sns.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "sns_topic" {
  name               = "${var.project_name}-sns-topic"
  assume_role_policy = data.aws_iam_policy_document.sns_trust_policy.json
}

resource "aws_iam_role_policy_attachment" "sns_topic" {
  role       = aws_iam_role.sns_topic.name
  policy_arn = var.sns_role_policy
}
