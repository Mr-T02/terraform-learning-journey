# Modules, Loops & Conditional Logic

Refactored EC2 provisioning into reusable Terraform modules, and explored dynamic resource creation.

## What This Covers

- **Modules** — breaking infrastructure code into reusable, parameterized components (`modules/ec2-instance`)
- **`count`** — creating multiple identical resources from one block
- **`for_each`** — creating multiple resources with distinct, readable identifiers (e.g., per-environment instances)
- **Conditional expressions** (`condition ? value_if_true : value_if_false`) — dynamically choosing values (e.g., instance type) based on an input variable

## Files

| File | Purpose |
|---|---|
| `main.tf` | Root module — calls the reusable `ec2-instance` module |
| `variables.tf` | Root-level input variables (e.g., `environment`) |
| `terraform.tfvars` | Actual values assigned to variables |
| `modules/ec2-instance/` | Reusable module defining a single EC2 instance's configuration |

## Key Learning

How Terraform handles changes to module-driven resources — specifically, why certain attribute changes (like instance type) force a destroy-and-recreate rather than an in-place update, and how to safely preview that behavior with `terraform plan` before applying.
