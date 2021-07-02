provider "aws" {
	region = var.region
}

# VPCs#####################################################
data "aws_vpc" "mainVPC" {}

locals {
    origin_id = "WebServerOrigin"
}

resource "aws_cloudfront_distribution" "main_dist" {
    origin {
        domain_name = aws_lb.MainLoadBalancer.dns_name
        origin_id = local.origin_id
    }
    default_cache_behavior {
        allowed_methods = ["GET", "HEAD"]
        cached_methods = ["GET", "HEAD"]
        target_origin_id = local.origin_id
        viewer_protocol_policy = "allow_all"
        forwarded_values{
            query_string = false
        }
    }
    enabled = true
    restrictions {
        geo_restriction {
            restriction_type = "whitelist"
            locations = ["UA", "PL"]
        }
    }
    viewer_certificate {
        cloudfront_default_certificate = true
    }
}