###  VPC Setup Structure

1. **Create a VPC**

2. **Create 3 Subnets** (in 2 Availability Zones):
   - **Public Subnet**
   - **Private Subnet**
   - **Database Subnet**

3. **Create 2 Availability Zones**:
   - `us-east-1a`
   - `us-east-1b`

4. **Create 3 Route Tables**:
   - **Public Route Table**
     - Add route: `0.0.0.0/0` → Internet Gateway (IGW)
   - **Private Route Table**
     - Add route: `0.0.0.0/0` → NAT Gateway
   - **Database Route Table**
     - Add route: `0.0.0.0/0` → NAT Gateway

5. **Create an Internet Gateway (IGW)**

6. **Create a EIP & NAT Gateway**
   - Create Elastic IP for the NAT Gateway
   - Create nat gateway for attach EIP 
      - `allocation_id = aws_eip.ngw.id`
      -  `subnet_id     = aws_subnet.public_subnets[0].id` 


7. **Associate Route Tables**:
   - Public Subnet → **Public Route Table**
   - Private Subnet → **Private Route Table**
   - Database Subnet → **Database Route Table**

8. vpc Peering 
    - Peering from default vpc to new vpc
    