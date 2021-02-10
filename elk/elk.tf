data "template_file" "init_elasticsearch" {
  template = file("${path.module}/user_data/init_es.tpl")
  vars = {
    elasticsearch_cluster = var.elasticsearch_cluster
    elasticsearch_data_dir = var.elasticsearch_data_dir
  }
}
resource "aws_instance" "elasticsearch" {
  ami = var.aws_ami
  instance_type = var.elk_instance_type
  key_name = var.aws_key_name
  vpc_security_group_ids = [aws_security_group.elasticsearch_sg.id]
  subnet_id = var.elk_subnet_id
  iam_instance_profile = var.es_iam_id
  ebs_block_device {
    device_name = "/dev/sdb"
    volume_type = "io1"
    volume_size = "20"
    iops = "500"
  }
  user_data = data.template_file.init_elasticsearch.rendered
  tags = {
    Name = "${var.environment}_elasticsearch_instance"
    Environment = var.environment
  }
}
data "template_file" "init_logstash" {
  template = file("${path.module}/user_data/init_logstash.tpl")
  vars = {
    elasticsearch_host = aws_instance.elasticsearch.private_ip
  }
}
resource "aws_instance" "logstash" {
  ami = var.aws_ami
  instance_type = var.elk_instance_type
  key_name = var.aws_key_name
  vpc_security_group_ids = [aws_security_group.esearch_sg.id]
  subnet_id = var.elk_subnet_id
  ebs_block_device {
    device_name = "/dev/sdb"
    volume_type = "io1"
    volume_size = "20"
    iops = "500"
  }
 user_data = data.template_file.init_logstash.rendered
  tags = {
    Name = "${var.environment}_logstash_instance"
    Environment = var.environment
  }
}
data "template_file" "init_kibana" {
  template = file("${path.module}/user_data/init_kibana.tpl")
  vars = {
    elasticsearch_host = aws_instance.elasticsearch.private_ip
  }
}
resource "aws_instance" "kibana" {
  ami = var.aws_ami
  instance_type = var.elk_instance_type
  key_name = var.aws_key_name
  vpc_security_group_ids = [aws_security_group.elk_sg.id]
  subnet_id = var.elk_public_subnet_id
ebs_block_device {
    device_name = "/dev/sdb"
    volume_type = "io1"
    volume_size = "10"
    iops = "500"
  }
  user_data = data.template_file.init_kibana.rendered
  tags = {
    Name = "${var.environment}_kibana_instance"
    Environment = var.environment
  }
}

