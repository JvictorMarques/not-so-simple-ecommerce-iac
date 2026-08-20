resource "aws_sns_topic_subscription" "this" {
  count     = length(var.order_topic.subscriptions)
  topic_arn = aws_sns_topic.this.arn
  protocol  = "sqs"
  endpoint = one([
    for queue in aws_sqs_queue.standard : queue.arn
    if queue.name == var.order_topic.subscriptions[count.index]
  ])
}
