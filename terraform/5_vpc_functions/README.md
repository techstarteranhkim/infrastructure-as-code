# Terraform VPC Configuration

This Terraform configuration sets up a Virtual Private Cloud (VPC) in AWS with public and private subnets across three availability zones (AZs).

## Prerequisites

1. Install Terraform: Make sure you have Terraform installed on your local machine.

## Usage

1. Clone this repository.
2. Navigate to the directory containing these files.
3. Run `terraform init` to initialize the project.
4. Customize the variables in `variables.tf` if needed.
5. Run `terraform apply` to create the infrastructure.

## Files

1. **main.tf**: Defines the VPC and its CIDR block.
2. **variables.tf**: Contains local variables for AZs, subnet CIDRs, and names.
3. **subnets.tf**: Creates public and private subnets.
4. **routes.tf**: Sets up route tables and associations.
5. **outputs.tf**: Provides VPC and subnet IDs as outputs.

## Outputs

- `vpc_id`: ID of the created VPC.
- `public_subnet_ids`: IDs of the public subnets.
- `private_subnet_ids`: IDs of the private subnets.

---

Feel free to adapt this `README.md` to your project's specifics. If you have any further questions or need additional assistance, feel free to ask! 😊
