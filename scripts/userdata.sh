echo "Vamos que se puede con el curso" > ~/mensaje.txt
yum update -y
yum install httpd -y
systemctl enable httpd
systemctl start httpd