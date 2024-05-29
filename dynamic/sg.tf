#creating security groups
#resource(keyword) <resourse-type>(can't be changes) resource name(we can give accrdigly)
resource "aws_security_group" "allow_ports" {
    name = "allow_ports"
    description = "Allowing 80,22,8080,3306 ports"

    #dynamic blocks are used if we want to reuse the code with in a resource 

     dynamic "ingress" {
        for_each = var.inbound_rules
        content{
            from_port        = ingress.value["port"]
            to_port          = ingress.value["port"] 
            protocol         = ingress.value["protocol"]
            cidr_blocks      = ingress.value["cidr_blocks"]

        }

    }

    egress {
        from_port        = 0                 #0 indicates opening all ports
        to_port          = 0
        protocol         = "-1"               #-1 means all protocols
        cidr_blocks      = ["0.0.0.0/0"]
    }
    
    tags = {
        name = "allow_ports"
        createdby = "Bhavya"
    }

}

