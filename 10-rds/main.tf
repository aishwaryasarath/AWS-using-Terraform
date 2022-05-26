provider "aws" {
    region = "us-east-1"
}

resource "aws_db_instance" "my-rds" {
    db_name = "my-DB" // name of the database
    identifier = "my-first-rds" //unique name for that instance
    instance_class = "db.t2.micro"
    engine = "mariadb"
    engine_version = "10.2.21"
    username = "bob" // not good practice
    password = "password123" // not good practice
    port = 3306
    allocated_storage = 20
    skip_final_snapshot = true


}
  
