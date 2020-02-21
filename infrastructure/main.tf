# Raw data stream
module "bucket_raw_data" {
    source = "./modules/storage"

    bucket_name = "raw-stock-fundamentals"
}

module "raw_data_firehose" {
  source   = "./modules/streaming"

  firehose_name = "raw-data-firehose"
  firehose_destination = "s3"
  firehose_role = module.raw_data_firehose.firehose_to_s3_role
  firehose_destination_bucket_name = module.bucket_raw_data.s3_bucket_arn
}

# Clean data stream