<!-- In this tutorial we show how to configure the enviroment to provision ressource with Terraform(IaC) -->

# Terraform AWS Provisioning Setup Guide

This guide explains how to configure an AWS IAM user for Terraform provisioning from your local host machine, including AWS CLI setup, Terraform provider configuration, and remote state setup.

---

## 1. Create an IAM User

1. Go to **IAM → Users → Create user** in the AWS console.
2. User name: `terraform-user` (example).
3. **Access type**: Programmatic access (Access key).
4. **Permissions**:

   * For testing: attach `AdministratorAccess`.
   * For production: attach least-privilege policies (see section 5).
5. Download or copy the **Access Key ID** and **Secret Access Key**.

---

## 2. Configure AWS CLI on Your Host Machine

Run:

```bash
aws configure
```

Enter the following:

```text
AWS Access Key ID:     <your-access-key-id>
AWS Secret Access Key: <your-secret-access-key>
Default region name:  us-east-1
Default output format: json
```

Verify credentials:

```bash
aws sts get-caller-identity
```

Expected output:

```json
{
  "Account": "123456789012",
  "Arn": "arn:aws:iam::123456789012:user/terraform-user",
  "UserId": "AIDA..."
}
```

**Common error:**

```
Invalid endpoint: https://sts..amazonaws.com
```

➡ This occurs when the AWS region is missing. Fix by re-running `aws configure` or setting the environment variable:

```bash
export AWS_REGION=us-east-1
export AWS_DEFAULT_REGION=us-east-1
```

---

## 3. Configure Terraform AWS Provider

Create a `provider.tf` file:

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
```

**Optional:** use a named profile

```hcl
provider "aws" {
  region  = "us-east-1"
  profile = "terraform"
}
```

---

## 4. Remote State Setup (Recommended)

### 4.1 Create an S3 Bucket

* Enable versioning and encryption
* Example name: `mycompany-terraform-state`

### 4.2 Create a DynamoDB Table for Locking

* Table name: `terraform-locks`
* Partition key: `LockID` (String)

### 4.3 Configure S3 Backend in Terraform

```hcl
terraform {
  backend "s3" {
    bucket         = "mycompany-terraform-state"
    key            = "envs/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
```

### 4.4 Initialize Terraform with Remote State

```bash
terraform init
```

Answer **yes** if prompted to migrate existing state.

---

## 5. IAM Permissions Best Practices

**Minimal permissions example (EC2, S3, VPC, IAM):**

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:*",
        "vpc:*",
        "s3:*",
        "iam:PassRole",
        "iam:GetRole"
      ],
      "Resource": "*"
    }
  ]
}
```

**Notes:**

* Avoid using root account.
* Rotate keys regularly.
* Restrict S3 bucket access to Terraform user/role.

---

<!-- ## 6. Test Terraform Provisioning

Example resource `main.tf`:

```hcl
resource "aws_s3_bucket" "test" {
  bucket = "terraform-test-bucket-123456"
}
```

Run:

```bash
terraform init
terraform plan
terraform apply
```

Expected result: AWS resources provisioned successfully.

---

## 7. Summary Checklist

* [ ] IAM user with programmatic access created
* [ ] AWS CLI configured and tested
* [ ] Terraform AWS provider configured
* [ ] Remote state S3 + DynamoDB setup
* [ ] IAM permissions follow least-privilege
* [ ] Terraform provisioning tested -->
