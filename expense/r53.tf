#variables accessing in terraform(${}) Eg: "hello ${var.variable_name}" ---This is interpolation(text+variable)


resource "aws_route53_record" "expense" {
  count = length(var.instance_names)
  zone_id = var.zone_id
  name    = var.instance_names[count.index] == "FE" ? "frontend.${var.domain_name}" : "${var.instance_names[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 300
  records = var.instance_names[count.index] == "FE" ? [aws_instance.expense[count.index].public_ip] : [aws_instance.expense[count.index].private_ip]
  allow_overwrite = true #if record already exists. 
}