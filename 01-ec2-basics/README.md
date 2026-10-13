# EC2 Basics — Terraform Fundamentals

First hands-on Terraform project — provisioning a single AWS EC2 instance from scratch.

## What This Covers

- Terraform core workflow: `init` → `plan` → `apply` → `destroy`
- Provider configuration (AWS)
- Resource blocks (`aws_instance`)
- Input variables (`variables.tf`) and outputs (`outputs.tf`)
- SSH key pair generation and usage
- Security groups (inbound/outbound rules for SSH and HTTP)

## Files

| File | Purpose |
|---|---|
| `main.tf` | Core resource definitions (EC2 instance, key pair, security group) |
| `variables.tf` | Configurable input (e.g., instance type) |
| `outputs.tf` | Values exposed after apply (instance ID, public IP) |

## Key Learning

Understanding how Terraform tracks infrastructure state, and the difference between in-place updates vs. destroy-and-recreate behavior when certain resource attributes change.