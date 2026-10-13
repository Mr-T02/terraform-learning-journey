# VPC & Networking

Designed and provisioned a custom AWS network from scratch — moving beyond the AWS default VPC to a purpose-built architecture with public and private subnet separation.

## What This Covers

- **Custom VPC** — defining a private network space with a custom CIDR block
- **Public subnet** — configured with an Internet Gateway and route table for direct internet access
- **Private subnet** — isolated from the internet by design (no route to the Internet Gateway), simulating how sensitive resources (e.g., databases) are typically secured in production environments
- **Internet Gateway & Route Tables** — controlling exactly which subnets can reach the internet
- **Security Groups** — scoped to the custom VPC, controlling inbound/outbound traffic

## Files

| File | Purpose |
|---|---|
| `main.tf` | VPC, subnets, Internet Gateway, route tables, security group, and two EC2 instances (one public, one private) |

## Key Learning

Verified the public/private boundary empirically: successfully SSH'd into the public instance from the internet, while confirming the private instance received no public IP (`null`) and was therefore unreachable from outside the VPC — demonstrating the real-world security pattern used to isolate backend systems from direct internet exposure.

