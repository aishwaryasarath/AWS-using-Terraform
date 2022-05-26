variable "server_names" {
  type = list(string)
  
}

resource "aws_instance" "db" {
  ami           = "ami-0022f774911c1d690"
  instance_type = "t2.micro"
  count = length(var.server_names)

  tags = {
    Name = var.server_names[count.index]
  }
}

output "db-ip" {
    value = [aws_instance.db.*.private_ip]
  
}

