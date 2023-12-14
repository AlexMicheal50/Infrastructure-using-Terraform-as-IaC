variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "instance_type" {
  default = "t2.micro"
}

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  default = "10.0.1.0/24"
}

variable "db_instance_identifier" {
  default = "mydbinstance"
}

variable "s3_bucket_name" {
  default = "my-s3-bucket7857650"
}
