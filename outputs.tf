output "instance_arn" {
    value = aws_instance.WebServer1.arn
}
output "cloudfront_url" {
    value = aws_cloudfront_distribution.main_dist.domain_name
}