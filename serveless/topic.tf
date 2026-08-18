resource "aws_sns_topic" "order_confirmed" {
  name                             = var.order_topic.name
  kms_master_key_id                = "alias/aws/sns"
  sqs_success_feedback_sample_rate = 100
  sqs_success_feedback_role_arn    = aws_iam_role.sns_topic.arn
  sqs_failure_feedback_role_arn    = aws_iam_role.sns_topic.arn
}

resource "aws_sns_topic_policy" "order_confirmed" {
  arn = aws_sns_topic.order_confirmed.arn

  policy = data.aws_iam_policy_document.sns_policy.json
}
