resource "aws_kinesis_firehose_delivery_stream" "firehose" {
  name        = var.firehose_name
  destination = var.firehose_destination

  s3_configuration {
    role_arn   = var.firehose_role                      # aws_iam_role.raw_stock_fundamentals_firehose_role.arn
    bucket_arn = var.firehose_destination_bucket_name   # aws_s3_bucket.raw_stock_fundamentals.arn
  }
  tags = {
      Name = "investment-lake"
  }
}
