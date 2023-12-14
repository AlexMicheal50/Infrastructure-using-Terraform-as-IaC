# VPC => Using https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
}

# Subnet => Using 
resource "aws_subnet" "my_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.subnet_cidr_block
  availability_zone       = "us-east-1a"  # Change this to your desired availability zone
}

# Security Group for EC2 instance
resource "aws_security_group" "my_sg" {
  vpc_id = aws_vpc.my_vpc.id
  # Define your security group rules here
}

# EC2 Instance
resource "aws_instance" "my_instance" {
  ami           = "ami-0fc5d935ebf8bc3bc"  # Amazon Linux 2 AMI ID, change as needed
  instance_type = var.instance_type
  subnet_id     = aws_subnet.my_subnet.id

  # Add other configuration settings as needed
  # ...

  vpc_security_group_ids = [aws_security_group.my_sg.id]
}


# RDS Database
resource "aws_db_instance" "my_db_instance" {
  identifier            = var.db_instance_identifier
  engine                = "mysql"  # Change this to your desired database engine
  instance_class        = "db.t2.micro"
  allocated_storage     = 20
  storage_type          = "gp2"
  username              = "admin"
  password              = "password"
  publicly_accessible  = false
  vpc_security_group_ids = [aws_security_group.my_sg.id]

}

# S3 Bucket
resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = var.s3_bucket_name
  # Add other S3 bucket configurations as needed
}

# S3 Bucket ACL
resource "aws_s3_bucket_acl" "my_s3_bucket_acl" {
  bucket = aws_s3_bucket.my_s3_bucket.bucket
  # Define your ACL rules here
  # For example:
  # acl = "private"
}
