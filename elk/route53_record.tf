resource "aws_route53_record" "elastic_rr" {
  depends_on = [aws_instance.elasticsearch]
  zone_id = var.internal_zone_id
  name = "elastic.${var.environment}.${var.internal_dns_suffix}"
  type = "A"
  ttl = 30
  records = [aws_instance.elasticsearch.private_ip]
}
resource "aws_route53_record" "logstash_rr" {
  depends_on = [aws_instance.logstash]
  zone_id = var.internal_zone_id
  name = "logstash.${var.environment}.${var.internal_dns_suffix}"
  type = "A"
  ttl = 30
  records = [aws_instance.logstash.private_ip]
}
resource "aws_route53_record" "kibana" {
  depends_on = [aws_instance.kibana]
  zone_id = var.internal_zone_id
  name = "kibana.${var.environment}.${var.internal_dns_suffix}"
  type = "A"
  ttl = 30
  records = [aws_instance.kibana.private_ip]
}

