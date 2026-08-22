resource "aws_sqs_queue" "standard" {
  count                     = length(var.queue)
  name                      = var.queue[count.index].name
  delay_seconds             = var.queue[count.index].delay_seconds
  max_message_size          = var.queue[count.index].max_message_size
  message_retention_seconds = var.queue[count.index].message_retention_seconds
  receive_wait_time_seconds = var.queue[count.index].receive_wait_time_seconds
  sqs_managed_sse_enabled   = true
}

resource "aws_sqs_queue" "dlq" {
  count                     = length(var.queue)
  name                      = "${var.queue[count.index].name}Dlq"
  delay_seconds             = var.queue[count.index].delay_seconds
  max_message_size          = var.queue[count.index].max_message_size
  message_retention_seconds = var.queue[count.index].message_retention_seconds
  receive_wait_time_seconds = var.queue[count.index].receive_wait_time_seconds
  sqs_managed_sse_enabled   = true
}

resource "aws_sqs_queue_redrive_policy" "this" {
  count     = length(aws_sqs_queue.standard)
  queue_url = aws_sqs_queue.standard[count.index].id
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq[count.index].arn
    maxReceiveCount     = 2
  })
}

resource "aws_sqs_queue_redrive_allow_policy" "this" {
  count     = length(aws_sqs_queue.dlq)
  queue_url = aws_sqs_queue.dlq[count.index].id

  redrive_allow_policy = jsonencode({
    redrivePermission = "byQueue",
    sourceQueueArns   = [aws_sqs_queue.standard[count.index].arn]
  })
}
