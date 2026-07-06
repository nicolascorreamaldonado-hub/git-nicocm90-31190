us_east_1 = "10.10.0.0/16"

subnets = ["10.10.0.0/24", "10.10.1.0/24"]

tags = {
  "ambiente"        = "producción"
  "centro de costo" = "gerencia"
  "owner"           = "nicolas"
  "project"         = "must"
  "region"          = "virginia"
}

sg_ingress_cidr = "0.0.0.0/0"

ec2_specs = {
  ami           = "ami-0521cb2d60cfbb1a6"
  instance_type = "t3.micro"
}

enable_monitoring = false

ingress_port_list = [22, 80, 443] 