module "s3" {
    source = "./modules/s3"

    bucket_name = "raw-stock-fundamentals"
}

module "raw_data_firehose" {
  source   = "./modules/streaming"

  firehose_name = "raw-data-firehose"
  firehose_destination = "s3"
  firehose_role = module.raw_data_firehose.firehose_to_s3_role
  firehose_destination_bucket_name = module.s3.s3_bucket_name
}
