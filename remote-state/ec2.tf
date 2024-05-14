
#creating ec2 instance
resource "aws_instance" "remote-state" {

    ami = "ami-090252cbe067a9e58"
    vpc_security_group_ids = ["sg-014f3947b6035bd6d"]
    instance_type = "t3.micro"
    tags = {
        Name = "DB"
    }
   
}