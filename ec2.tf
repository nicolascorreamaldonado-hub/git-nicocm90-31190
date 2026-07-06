variable "instancias" {
  description = "Nombre de instancias"
  type        = list(string)
  default     = ["apache"]
}

resource "aws_instance" "proceso_chile" {
  for_each               = toset(var.instancias)
  ami                    = var.ec2_specs.ami
  instance_type          = var.ec2_specs.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  user_data              = file("scripts/userdata.sh")

  tags = {
    "Name" = "${each.value}-${local.sufix}"
  }
}




resource "aws_instance" "proceso_monitoreo" {
  count                  = var.enable_monitoring ? 1 : 0
  ami                    = var.ec2_specs.ami
  instance_type          = var.ec2_specs.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  user_data              = file("scripts/userdata.sh")

  tags = {
    "Name" = "monitoreo-${local.sufix}"
  }
}
/*
  provisioner "local-exec" {
    command = "echo instancia creada ip ${aws_instance.proceso_chile.public_ip} > datos_instancia.txt"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo instancia ip ${self.public_ip} destruida > datos_instancia.txt"
  }
*/





/*
provisioner "remote-exec" {
  inline = [
    "echo 'Hola Mundo acá estamos!!!' >  ~/saludos.txt" 
  ]
  connection {
    type = "ssh"
    host = self.public_ip
    user = "ec2-user"
    private_key = file("chile-key.pem")
  }
}


  tags = {
    Name = "HelloWorld"
  }
  lifecycle {
    create_before_destroy = true
    prevent_destroy       = false
  }

 */

/* resource "aws_instance" "myvpc" {
    ami                                  = "ami-06067086cf86c58e6"
    instance_type                        = "t3.micro"
    key_name                             = data.aws_key_pair.key.key_name

    subnet_id                            = aws_subnet.public_subnet.id
    tags                                 = {
        "Name" = "Myvpc"
    }
    vpc_security_group_ids               = [
        aws_security_group.sg_public_instance.id,
    ]
} */