# AWS Services and Required Features

This document lists **major AWS services** and the **core features / components required to build or provision each service** (especially useful for Terraform, CloudFormation, or architectural design).

---

## 1. Compute

### EC2 (Elastic Compute Cloud)

**Required features:**

* VPC
* Subnet (public/private)
* AMI (Amazon Machine Image)
* Instance type
* Key pair
* Security Group
* IAM role (optional but recommended)
* EBS volumes
* User data (optional)

### Lambda

**Required features:**

* Runtime (Python, Node.js, etc.)
* Execution role (IAM)
* Handler function
* Memory & timeout settings
* Trigger source (API Gateway, S3, EventBridge, etc.)
* Environment variables

### ECS (Elastic Container Service)

**Required features:**

* Cluster
* Task definition
* Container image (ECR/DockerHub)
* IAM roles (task + execution)
* Networking (VPC, subnets, security groups)
* Load balancer (optional)

### EKS (Elastic Kubernetes Service)

**Required features:**

* VPC
* Subnets (private recommended)
* EKS cluster
* Node groups or Fargate profiles
* IAM roles & policies
* kubectl & kubeconfig

---

## 2. Networking

### VPC (Virtual Private Cloud)

**Required features:**

* CIDR block
* Subnets
* Route tables
* Internet Gateway
* NAT Gateway (optional)
* Network ACLs

### Application Load Balancer (ALB)

**Required features:**

* VPC
* Subnets
* Security group
* Listener (HTTP/HTTPS)
* Target group
* SSL certificate (for HTTPS)

### Route 53

**Required features:**

* Hosted zone
* DNS records (A, CNAME, ALIAS)
* Health checks (optional)

---

## 3. Storage

### S3 (Simple Storage Service)

**Required features:**

* Bucket name
* Region
* Bucket policy
* ACL or Object Ownership
* Versioning (optional)
* Encryption
* Lifecycle rules (optional)

### EBS (Elastic Block Store)

**Required features:**

* Volume size
* Volume type
* Availability Zone
* Attachment to EC2

### EFS (Elastic File System)

**Required features:**

* VPC
* Mount targets
* Security group
* Performance mode

---

## 4. Databases

### RDS (Relational Database Service)

**Required features:**

* Engine (MySQL, PostgreSQL, etc.)
* Instance class
* Storage size & type
* VPC & subnet group
* Security group
* Username & password
* Backup & maintenance window

### DynamoDB

**Required features:**

* Table name
* Partition key
* Sort key (optional)
* Billing mode (on-demand/provisioned)
* GSIs/LSIs (optional)

### Aurora

**Required features:**

* Engine type
* Cluster
* Instances
* Subnet group
* Security groups

---

## 5. Security & Identity

### IAM

**Required features:**

* Users / Roles
* Policies
* Trust relationships
* MFA (optional)

### KMS (Key Management Service)

**Required features:**

* Key
* Key policy
* Rotation settings
* Grants

### Secrets Manager

**Required features:**

* Secret name
* Secret value
* KMS key
* Rotation policy (optional)

---

## 6. Monitoring & Logging

### CloudWatch

**Required features:**

* Log groups
* Log streams
* Metrics
* Alarms
* Dashboards

### CloudTrail

**Required features:**

* Trail
* S3 bucket for logs
* IAM permissions
* Event selectors

---

## 7. DevOps & CI/CD

### CodeCommit

**Required features:**

* Repository
* IAM access

### CodeBuild

**Required features:**

* Build project
* Buildspec file
* IAM role
* Source provider

### CodePipeline

**Required features:**

* Pipeline
* Stages (source, build, deploy)
* Artifact store (S3)
* IAM role

---

## 8. Messaging & Integration

### SQS

**Required features:**

* Queue name
* Queue type (standard/FIFO)
* Retention period
* IAM access

### SNS

**Required features:**

* Topic
* Subscriptions (email, lambda, http)
* Access policy

### EventBridge

**Required features:**

* Event bus
* Rules
* Targets

---

## 9. Analytics & Big Data

### Athena

**Required features:**

* S3 data source
* Database
* Table definitions
* IAM permissions

### Redshift

**Required features:**

* Cluster
* Node type
* Database name
* Subnet group
* Security group

---

## 10. AI & ML

### SageMaker

**Required features:**

* Notebook or training job
* IAM role
* S3 bucket
* Instance type

---

## 11. Management & Governance

### Systems Manager (SSM)

**Required features:**

* IAM role
* SSM agent
* Parameter store
* Session manager




