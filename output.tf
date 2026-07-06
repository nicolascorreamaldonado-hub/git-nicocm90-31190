/*
output "ec2_public_id" {
  description = "IP publica de la instancia"
  value = {
    for nombre, instancia in aws_instance.proceso_chile :
    nombre => instancia.public_ip
  }
}
*/