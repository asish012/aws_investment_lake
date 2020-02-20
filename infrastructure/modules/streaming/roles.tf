resource "aws_iam_role_policy" "firehose_to_s3_policy" {
  name = "firehose-to-s3-policy"
  role = aws_iam_role.firehose_to_s3_role.id

  policy = file("${path.module}/../iam/firehose_to_s3_policy.json")
}

resource "aws_iam_role" "firehose_to_s3_role" {
  name = "firehose-to-s3-role"

  assume_role_policy = file("${path.module}/../iam/firehose_to_s3_role.json")
}
