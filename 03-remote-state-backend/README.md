# Remote State Management

Sets up a team-ready Terraform backend using Amazon S3 and DynamoDB — moving state management from a local file to a shared, lockable remote store.

## What This Covers

- **Remote state** — storing `terraform.tfstate` in an S3 bucket instead of locally, enabling safe multi-person collaboration
- **State locking** — using a DynamoDB table to prevent concurrent `apply` operations from corrupting state
- **S3 bucket versioning** — enabling recovery of previous state file versions if needed
- The "bootstrap problem" — why backend infrastructure (the S3 bucket/DynamoDB table) must be provisioned in a separate, local-state project before any other project can use it as a backend

## Files

| File | Purpose |
|---|---|
| `main.tf` | Defines the S3 bucket (state storage) and DynamoDB table (state locking) |

## Key Learning

Verified state locking behavior by deliberately running `terraform apply` from two terminal sessions simultaneously — confirming that the second session is correctly blocked until the first completes, proving the locking mechanism works as intended in a real multi-user scenario.
