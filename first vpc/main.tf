provider "aws" {
  region = "us-east-1"
}

#1. create your VPC
resource "aws_vpc" "ironman" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "name" = "ironman"
  }
}

#2. create a public subnet 
resource "aws_subnet" "PublicSubnet" {
    vpc_id = aws_vpc.ironman.id
    availability_zone = "us-east-1a"
    cidr_block = "10.0.1.0/24"
  
}

#3. create a private subnet

resource "aws_subnet" "PrivSubnet" {
  vpc_id = aws_vpc.ironman.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = true
}

#4. create an IGW
resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.ironman.id
}

#5. route tables for public subnet 
resource "aws_route_table" "PublicRT" {
    vpc_id = aws_vpc.ironman.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.myigw.id
    }
  
}
#6 route table association with public subnet

resource "aws_route_table_association" "PublicRouteTableAssociation" {
  subnet_id = aws_subnet.PublicSubnet.id
  route_table_id = aws_route_table.PublicRT.id
}




