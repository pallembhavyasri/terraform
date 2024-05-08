#1.command prompt var 
#2. is .tfvars var
#3. environment var
#4. default 
variable "ami_image_id" {
    type = string
    default = "ami-090252cbe067a9e58"
    description = "RHEL-9 AMI ID"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
}

variable "tags"{
    default = {
        Name = "DB"
        createdby = "Bhaya"
        project = "Expense"
        module = "DB"
    }
}

variable "sg_name"{
    default = "allow_ssh"
}

variable "sg_desc"{
    default = "Allowing SSH access"
}

variable "protocol"{
    default = "tcp"
}

variable "allow_cidr"{
    default = ["0.0.0.0/0"]
}

variable "SSH_tags"{
    default = {
        name = "allow_ssh"
        createdby = "Bhavya"
    }
}

variable "SSH_port"{
    default = 22 
}