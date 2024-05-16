variable "instance_names"{
    type = map 
    default = {
        db = "t3.micro"
        backend = "t3.small"
        frontend = "t3.small"
    }
}

variable "common_tags"{
    default = {
        Environment = "Dev"
        createdby = "Bhavya"
        project = "Expense"
        terraform = "true"
    }
}


#r53 variables

variable "zone_id"{
    default = "Z0594556UZMHX8MM4MSM"
}

variable "domain_name"{
    default = "bhavya.store"
}