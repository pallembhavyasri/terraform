#creating security groups
#resource(keyword) <resourse-type>(can't be changes) resource name(we can give accrdigly)
resource "aws_security_group" "allow_ssh" {
    name = var.sg_name
    description = var.sg_desc

     ingress {
        from_port        = var.SSH_port
        to_port          = var.SSH_port   #22 is for SSH 
        protocol         = var.protocol
        cidr_blocks      = var.allow_cidr
    }

    egress {
        from_port        = 0                 #0 indicates opening all ports
        to_port          = 0
        protocol         = "-1"               #-1 means all protocols
        cidr_blocks      = var.allow_cidr
    }
    
    tags = var.SSH_tags

}


#creating ec2 instance
resource "aws_instance" "DB" {

    ami = var.ami_image_id
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    instance_type = var.instance_type
    tags = var.tags
}