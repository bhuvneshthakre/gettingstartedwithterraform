# Terraform VPC Configuration

This Terraform configuration creates a Virtual Private Cloud (VPC) along with a public subnet, a private subnet, and an Internet Gateway on AWS in the "us-east-1" region. The VPC resources are tagged with appropriate names for identification.

## Prerequisites

Before you can use this Terraform configuration, you need to have the following prerequisites:

1. **Terraform Installed:** Make sure you have Terraform installed on your local machine. You can download it from the official website: https://www.terraform.io/downloads.html

2. **AWS Credentials:** Set up your AWS credentials with the necessary permissions for creating VPC resources.

## Usage

To use this Terraform configuration, follow these steps:

1. Create a new Terraform configuration file (e.g., `main.tf`) in an empty directory.
2. Copy the code from this repository and paste it into the `main.tf` file.
3. Run `terraform init` to initialize the working directory.
4. Run `terraform plan` to preview the changes that will be applied.
5. If everything looks good, run `terraform apply` to create the VPC and its resources.

## Resources Created

This Terraform configuration creates the following AWS resources:

1. **VPC:** A new VPC is created with the CIDR block "10.0.0.0/16" and tagged with the name "ironman."

2. **Public Subnet:** A public subnet is created within the VPC with the CIDR block "10.0.1.0/24" in the availability zone "us-east-1a."

3. **Private Subnet:** A private subnet is created within the VPC with the CIDR block "10.0.2.0/24." This subnet has the "map_public_ip_on_launch" attribute set to true, allowing instances launched in this subnet to have public IP addresses.

4. **Internet Gateway (IGW):** An Internet Gateway is created and attached to the VPC.

5. **Route Table for Public Subnet:** A route table is created and associated with the public subnet. It has a default route to the Internet Gateway, allowing instances in the public subnet to access the internet.

## Clean Up

To avoid unexpected charges, remember to run `terraform destroy` after you have finished using the VPC resources.

## Authors

- Bhuvnesh thakre

## License

This project is licensed under the [MIT License](link-to-license-file). Feel free to use and modify the Terraform configuration as per your needs. We appreciate any contributions or feedback you may have!
