# Firehose to S3 role & policy
module "firehose_to_s3_role" {
    source                     = "./modules/role"
    firehose_to_s3_role_name   = "firehose-to-s3-role"
    firehose_to_s3_policy_name = "firehose-to-s3-policy"
}

# Raw data stream
module "bucket_raw_data" {
    source      = "./modules/storage"
    bucket_name = "raw-stock-fundamentals"
    tag_name    = "investment-lake"
}

module "raw_data_firehose" {
  source                           = "./modules/streaming"
  firehose_name                    = "raw-data-firehose"
  firehose_destination             = "s3"
  firehose_role                    = module.firehose_to_s3_role.firehose_to_s3_role_arn
  firehose_destination_bucket_name = module.bucket_raw_data.s3_bucket_arn
  tag_name                         = "investment-lake"
}

# Clean data stream
module "bucket_clean_data" {
    source      = "./modules/storage"
    bucket_name = "clean-stock-fundamentals"
    tag_name    = "investment-lake"
}

module "clean_data_firehose" {
  source                           = "./modules/streaming"
  firehose_name                    = "clean-data-firehose"
  firehose_destination             = "s3"
  firehose_role                    = module.firehose_to_s3_role.firehose_to_s3_role_arn
  firehose_destination_bucket_name = module.bucket_clean_data.s3_bucket_arn
  tag_name                         = "investment-lake"
}
