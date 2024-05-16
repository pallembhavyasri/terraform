data "aws_ami" "ami_id"{
    most_recent = true
    owners = ["973714476881"] #ami owneer id

    #we can use as many filters as we want to fetch 
    filter {
        name = "name"
        values = ["RHEL-9-DevOps-Practice"]

    }

}

data "aws_vpc" "default"{
    default = true
}