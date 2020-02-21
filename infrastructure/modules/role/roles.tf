resource "aws_iam_role_policy" "firehose_to_s3_policy" {
  name = var.firehose_to_s3_policy_name
  role = aws_iam_role.firehose_to_s3_role.id

  policy = file("${path.module}/../iam/firehose_to_s3_policy.json")
}

resource "aws_iam_role" "firehose_to_s3_role" {
  name = var.firehose_to_s3_role_name

  assume_role_policy = file("${path.module}/../iam/firehose_to_s3_role.json")
}
