#1.command prompt var 
#2. is .tfvars var
#3. environment var
#4. default 

#instance variables
variable "ami_image_id" {
    type = string
    default = "ami-090252cbe067a9e58"
    description = "RHEL-9 AMI ID"
}


variable "instance_names"{
    type = list 
    default = ["DB", "Backend", "FE"]
}


variable "instance_type" {
    type = string
    default = "t3.micro"
}

variable "common_tags"{
    default = {
        Environment = "Dev"
        createdby = "Bhavya"
        project = "Expense"
        terraform = "true"
    }
}

#sg variables
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


#r53 variables

variable "zone_id"{
    default = "Z0594556UZMHX8MM4MSM"
}

variable "domain_name"{
    default = "bhavya.store"
}