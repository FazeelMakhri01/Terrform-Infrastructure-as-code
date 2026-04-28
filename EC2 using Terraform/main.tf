
##So to create aws ec2 we need following things
##1. ssh-key pair, to do that we'll generate a ssh

resource "aws_key_pair" "deployer" {
    key_name = "aws_key_pair"
    public_key = file("aws_key_pair.pub")
}

resource "aws_default_vpc" "mainvpc"{

}

resource "aws_default_security_group" "default" {
    vpc_id = aws_default_vpc.mainvpc.id            #associating the default security group with the vpc we created above

     ingress {                                      #allowing ssh access to the instance
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {                                      #allowing http access to the instance
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {                                      #allowing https access to the instance
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {                                       #allowing all outbound traffic from the instance
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
}

resource "aws_instance" "Nginx"{
    ami =   "ami-0685f8dd865c8e389" #Amazon Linux 2 AMI (HVM), SSD Volume Type
    instance_type = var.aws_instance_type #using the variable we created above for instance type 
    key_name = aws_key_pair.deployer.key_name #associating the ssh key  pair we created above with the instance
    vpc_security_group_ids = [aws_default_security_group.default.id] # use IDs for VPC
    
    root_block_device {
        volume_size = 16    
        volume_type = "gp3"
    }


}



