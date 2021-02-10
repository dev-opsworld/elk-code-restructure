resource "aws_security_group" "elk_sg" {
    name = "elk_default_security_group"
    description = "main security group for instances in public subnet"
    vpc_id = var.vpc_id
    ingress {
        from_port = 5601
        to_port = 5601
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "${var.environment}_elk_default_sg"
        Environment = var.environment
    }
}
resource "aws_security_group" "esearch_sg" {
    name = "elk_esearch_security_group"
    description = "Security group for Elasticsearch instance"
    vpc_id = var.vpc_id
    ingress {
        from_port = 0
        to_port = 65535
        protocol = "tcp"
        cidr_blocks = [var.elk_subnet_cidr_block, var.private_subnet_cidr_block, var.public_subnet_cidr_block]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "${var.environment}_esearch_sg"
        Environment = var.environment
    }

}
resource "aws_security_group" "elasticsearch_sg" {
    name = "elasticsearch_security_group"
    description = "Security group for elasticsearch cluster"
    vpc_id = var.vpc_id
    ingress {
        from_port = 9200
        to_port = 9400
        protocol = "tcp"
        cidr_blocks = [var.elk_subnet_cidr_block, var.private_subnet_cidr_block, var.public_subnet_cidr_block]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
 }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "${var.environment}_elasticsearch_sg"
        Environment = var.environment
    }
}

