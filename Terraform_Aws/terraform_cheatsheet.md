# Terraform Cheatsheet

## Terraform Basics

```bash
terraform version              # Show Terraform version
terraform help                 # Show help
terraform -help                # CLI help
```

## Project Initialization

```bash
terraform init                 # Initialize working directory
terraform init -upgrade        # Upgrade providers/modules
```

## Configuration & Formatting

```bash
terraform fmt                  # Format configuration files
terraform fmt -recursive       # Format all files recursively
terraform validate             # Validate configuration
```

## Planning & Applying

```bash
terraform plan                 # Show execution plan
terraform plan -out=tfplan     # Save plan to file
terraform apply                # Apply changes
terraform apply tfplan         # Apply saved plan
terraform apply -auto-approve  # Skip approval
```

## Destroying Infrastructure

```bash
terraform destroy              # Destroy all resources
terraform destroy -auto-approve
```

## State Management

```bash
terraform state list           # List resources in state
terraform state show <res>     # Show resource details
terraform state mv old new     # Move resource in state
terraform state rm <res>       # Remove resource from state
terraform refresh              # Refresh state
```

## Workspaces

```bash
terraform workspace list       # List workspaces
terraform workspace new dev    # Create workspace
terraform workspace select dev # Select workspace
terraform workspace delete dev # Delete workspace
```

## Providers & Modules

```bash
terraform providers            # Show providers
terraform providers lock       # Lock provider versions
terraform get                  # Download modules
terraform init -reconfigure    # Reconfigure backend
```

## Variables

```bash
terraform plan -var="env=dev"  # Set variable
terraform plan -var-file=dev.tfvars
export TF_VAR_region=us-east-1
```

## Outputs

```bash
terraform output               # Show all outputs
terraform output vpc_id        # Show specific output
```

## Import Existing Resources

```bash
terraform import aws_vpc.main vpc-123456
```

## Graph & Visualization

```bash
terraform graph | dot -Tpng > graph.png
```

## Debugging & Logging

```bash
terraform plan -detailed-exitcode
export TF_LOG=DEBUG
export TF_LOG_PATH=terraform.log
```

## Backend & State Locking

```bash
terraform init -migrate-state

terraform init -backend-config=backend.hcl
terraform force-unlock <lock_id>
```

## Common Flags

| Flag           | Meaning                  |
| -------------- | ------------------------ |
| -auto-approve  | Skip confirmation        |
| -var           | Set variable             |
| -var-file      | Variable file            |
| -target        | Target specific resource |
| -refresh=false | Disable refresh          |

## Typical Workflow

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```


