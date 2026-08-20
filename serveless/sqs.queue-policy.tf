data "aws_iam_policy_document" "sqs_policy" {
  count = length(aws_sqs_queue.standard)
  statement {
    effect    = "Allow"
    resources = [aws_sqs_queue.standard[count.index].arn]
    actions = [
      "sqs:*",
    ]
    principals {
      type        = "AWS"
      identifiers = [var.account_id]
    }
    principals {
      type        = "Service"
      identifiers = ["sns.amazonaws.com"]
    }
  }
}

resource "aws_sqs_queue_policy" "standard" {
  count     = length(aws_sqs_queue.standard)
  queue_url = aws_sqs_queue.standard[count.index].id
  policy    = data.aws_iam_policy_document.sqs_policy[count.index].json
}
