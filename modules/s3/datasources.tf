// Datasource: útil para buscar informações de recursos que já existem no AWS
data "aws_s3_bucket" "bucket" {
  bucket = "${var.s3_bucket_name}-${terraform.workspace}"
}