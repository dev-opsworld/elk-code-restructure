output "elastic_private_ip" {
  value = aws_instance.elasticsearch.private_ip
}
output "logstash_private_ip" {
  value = aws_instance.logstash.private_ip
}
output "kibana_private_ip" {
  value = aws_instance.kibana.private_ip
}
