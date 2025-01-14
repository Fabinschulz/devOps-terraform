variable "origin_id" {
  type        = string
  description = "The origin id S3"
}

variable "bucket_domain_name" {
  type        = string
  description = "Domain name S3"
}

variable "cdn_price_class" {
  type        = string
  description = "The price class for this distribution"
  default     = "PriceClass_200"
}

variable "cdn_tags" {
  type        = map(string)
  description = "A map of tags to assign to the resource"
  default     = {}
}