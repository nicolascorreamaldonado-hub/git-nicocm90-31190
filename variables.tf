variable "us_east_1" {
  description = "cidr u-east-1"
  type        = string
  sensitive   = true
}

variable "subnets" {
  description = "Lista de subnets"
  type        = list(string)
  sensitive   = true
}

variable "tags" {
  description = "Tags del proyecto"
  type        = map(string)
}

variable "sg_ingress_cidr" {
  description = "CIDR for ingress traffic"
  type        = string
}

variable "ec2_specs" {
  description = "Parametros de la instancia"
  type        = map(string)
}

variable "enable_monitoring" {
  description = "habilita el despliegue de un servidor de monitoreo"
  type        = bool

}


variable "ingress_port_list" {
  description = "Lista de puertos de ingress"
  type        = list(number)

}


/*
variable "public_subnet" {
    description = "cidr u-east-1"
    type = string
    sensitive = true
}

variable "private_subnet" {
    description = "cidr u-east-1"
    type = string
    sensitive = true
}

*/
