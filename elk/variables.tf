variable "elasticsearch_data_dir" {
  default = "/opt/elasticsearch/data"
}



variable "elasticsearch_cluster" {
  description = "Name of the elasticsearch cluster"
  default     = "elk_cluster"
}



variable "aws_ami" {
  description = "ubuntu ami"
}



variable "elk_instance_type" {
  default = "t3a.small"
  description = "instance type"
}



variable "es_iam_id" {
  default = "es_iam_id"
  description = "elasticsearch iam id"
}
variable "aws_key_name" {
  default = "aws_key_name"
  description = "key name"
}
variable "subnet_id" {
  default = "subnet_id"
  description = "subnet id"
}



variable "elk_subnet_id" {
  default = "elk_subnet_id"
  description = "elk subnet id"
}

variable "elk_public_subnet_id" {
  default = "elk_public_subnet_id"
  description = "elk public subnet id"
}



variable "vpc_id" {
  description = "elk vpc id"

}

variable "public_subnet_cidr_block" {
    type = string
    description = "public subnet cidr block"
}



variable "elk_subnet_cidr_block" {
  type = string
  description = "elk subnet cidr block"
}

variable "private_subnet_cidr_block" {
  type = string
  description = "private subnet cidr block"
}
variable "internal_zone_id" {
  type = string
  description = "internal zone id"
}
variable "internal_dns_suffix" {
  type = string
  description = "internal dns suffix"
}
variable "environment" {
  description = "environment"
}

