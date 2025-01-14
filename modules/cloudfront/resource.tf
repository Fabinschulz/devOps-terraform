resource "aws_cloudfront_distribution" "s3_cloudfront" {
  enabled             = true
  is_ipv6_enabled     = true
  comment             = "S3 bucket distribution"
  price_class         = "${var.cdn_price_class}"

  origin {
    domain_name = "${var.bucket_domain_name}"
    origin_id   = "${var.origin_id}"
    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "https-only"
      origin_ssl_protocols   = ["TLSv1"]
    }

  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = var.origin_id

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  tags = "${var.cdn_tags}"
}