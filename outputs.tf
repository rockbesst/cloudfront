output "instance_arn" {
    value = aws_ec2.WebServer1.arn
}
output "cloudfront_url" {
    value = aws_cloudfront_distribution.main_dist.domain_name
}