output "ec2_instance_ip" {
  value = aws_instance.my_instance.public_ip
}

output "rds_endpoint" {
  value = aws_db_instance.my_db_instance.endpoint
}

output "s3_bucket_name" {
  value = aws_s3_bucket.my_s3_bucket.bucket
}
