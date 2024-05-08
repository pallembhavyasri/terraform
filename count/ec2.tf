#creating security groups
#resource(keyword) <resourse-type>(can't be changes) resource name(we can give accrdigly)
resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "Allowing SSH access"

     ingress {
        from_port        = 22
        to_port          = 22   #22 is for SSH 
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    egress {
        from_port        = 0                 #0 indicates opening all ports
        to_port          = 0
        protocol         = "-1"               #-1 means all protocols
        cidr_blocks      = ["0.0.0.0/0"]
    }
    
    tags = {
        name = "allow_ssh"
        createdby = "Bhavya"
    }

}


#creating ec2 instance
resource "aws_instance" "DB" {
    count = 3 
    ami = "ami-090252cbe067a9e58"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    instance_type = "t3.micro"
    tags = {
        Name = var.instance_names[count.index]
    }
}