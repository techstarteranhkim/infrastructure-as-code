1. **Provider und Region:**

   ```hcl
   provider "aws" {
     region = "eu-central-1"
   }
   ```

   - Hier wird der AWS-Anbieter konfiguriert, und die Region wird auf "eu-central-1" festgelegt.

2. **VPC (Virtual Private Cloud):**

   ```hcl
   resource "aws_vpc" "my_vpc" {
     cidr_block = "10.0.0.0/16"
   }
   ```

   - Wir erstellen eine VPC mit dem CIDR-Block "10.0.0.0/16".

3. **Private Subnets:**

   ```hcl
   resource "aws_subnet" "private_subnet_a" {
     vpc_id           = aws_vpc.my_vpc.id
     cidr_block       = "10.0.1.0/24"
     availability_zone = "eu-central-1a"
   }

   resource "aws_subnet" "private_subnet_b" {
     vpc_id           = aws_vpc.my_vpc.id
     cidr_block       = "10.0.2.0/24"
     availability_zone = "eu-central-1b"
   }
   ```

   - Wir erstellen zwei private Subnetze in den Availability Zones "eu-central-1a" und "eu-central-1b".

4. **Internet Gateway:**

   ```hcl
   resource "aws_internet_gateway" "my_igw" {
     vpc_id = aws_vpc.my_vpc.id
   }
   ```

   - Ein Internet Gateway wird erstellt und der VPC zugeordnet.

5. **Public Subnets:**

   ```hcl
   resource "aws_subnet" "public_subnet_a" {
     vpc_id           = aws_vpc.my_vpc.id
     cidr_block       = "10.0.3.0/24"
     availability_zone = "eu-central-1a"
   }

   resource "aws_subnet" "public_subnet_b" {
     vpc_id           = aws_vpc.my_vpc.id
     cidr_block       = "10.0.4.0/24"
     availability_zone = "eu-central-1b"
   }
   ```

   - Wir erstellen zwei öffentliche Subnetze in denselben Availability Zones.

6. **Routing-Tabelle:**

   ```hcl
   resource "aws_route_table" "my_route_table" {
     vpc_id = aws_vpc.my_vpc.id

     route {
       cidr_block = "0.0.0.0/0"
       gateway_id = aws_internet_gateway.my_igw.id
     }
   }
   ```

   - Eine Routing-Tabelle wird erstellt, die den Internetverkehr über das Internet Gateway leitet.

7. **Routing-Tabelle-Verknüpfungen:**

   ```hcl
   resource "aws_route_table_association" "public_subnet_a_association" {
     subnet_id      = aws_subnet.public_subnet_a.id
     route_table_id = aws_route_table.my_route_table.id
   }

   resource "aws_route_table_association" "public_subnet_b_association" {
     subnet_id      = aws_subnet.public_subnet_b.id
     route_table_id = aws_route_table.my_route_table.id
   }
   ```

   - Die Routing-Tabelle wird mit den öffentlichen Subnetzen verknüpft.
