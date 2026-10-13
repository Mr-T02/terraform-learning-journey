# Terraform Learning Journey

Hands-on DevOps learning project — self-taught, from zero prior experience to deploying and managing real AWS infrastructure using Terraform.

## About

This repository documents a structured, hands-on journey through Terraform and AWS infrastructure provisioning. Every project here was built, tested, and deployed on real AWS infrastructure (free-tier), with a focus on understanding *why* each concept matters, not just copying commands.

## What's Covered

| # | Topic | Key Concepts |
|---|---|---|
| [01](./01-ec2-basics) | EC2 Basics | Provider setup, resource blocks, variables, outputs, SSH key pairs, security groups |
| [02](./02-modules-and-loops) | Modules, Loops & Conditionals | Reusable modules, `count`, `for_each`, conditional expressions (`? :`) |
| [03](./03-remote-state-backend) | Remote State Management | S3 backend, DynamoDB state locking, team-collaboration-ready infrastructure |
| [04](./04-vpc-networking) | VPC & Networking | Custom VPC, public/private subnets, Internet Gateway, route tables, security groups |

## Tools & Technologies

- **Terraform** (IaC provisioning)
- **AWS** (EC2, S3, DynamoDB, VPC, IAM)
- **Ansible** (configuration management — used alongside Terraform in early projects)
- **Git/GitHub** (version control)
- **WSL (Ubuntu)** as the development environment

## Skills Demonstrated

- Infrastructure as Code fundamentals (plan/apply/destroy workflow)
- Writing reusable, modular Terraform code
- Managing team-safe remote state with locking
- Designing custom network architecture (VPC, public/private subnet separation)
- Debugging real Terraform errors (provider versioning, syntax issues, state conflicts)
- Terraform state management (`import`, `state mv`, `state rm`, `apply -replace`)

## Note

Each folder contains its own `README.md` with project-specific details. AWS credentials, state files, and `.terraform/` directories are intentionally excluded from this repository (see `.gitignore`).