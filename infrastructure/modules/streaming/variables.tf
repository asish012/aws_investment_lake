variable "firehose_name" {
  description = "The name for the firehose"
  type        = string
}

variable "firehose_destination" {
  description = "The name for the firehose"
  type        = string
  default     = "s3"
}

variable "firehose_role" {
  description = "The role for the firehose"
  type        = string
}

variable "firehose_destination_bucket_name" {
  description = "The s3 bucket destination of the firehose"
  type        = string
}

variable "tag_name" {
  description = "The tag name of the firehose stream"
  type        = string
}
