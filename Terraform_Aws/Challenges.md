# Fixing GitHub Push Errors Caused by Terraform `.terraform` Files

This guide documents the **complete troubleshooting and resolution steps** for fixing GitHub push failures caused by accidentally committing Terraform provider binaries (`.terraform/`).

---

## ❗ Problem Summary

When running:

```bash
git push origin main --force
```

GitHub rejects the push with errors like:

```
GH001: Large files detected
File terraform-provider-aws_vX.Y.Z is XXX MB; exceeds GitHub's 100 MB limit
```

### Root Cause

* Terraform provider binaries were downloaded via `terraform init`
* `.terraform/` directories were committed to Git
* `.gitignore` was added **after** the files were already tracked
* Large files remained in **Git history**, not just the working tree

---

## ✅ Correct `.gitignore` for Terraform

Place this in the **repo root**:

```gitignore
#######################################
# Terraform
#######################################

.terraform/
**/.terraform/

*.tfstate
*.tfstate.*
crash.log

*.tfvars
*.tfvars.json

.terraformrc
terraform.rc

# Dependency lock file (recommended to keep)
# .terraform.lock.hcl
```

> ⚠️ `.gitignore` does **not** remove files already tracked by Git.

---

## 🔍 Step 1: Identify Tracked Terraform Files

Run from repo root:

```bash
git ls-files | grep terraform-provider
git ls-files | grep '\.terraform'
```

If output appears, Git is still tracking Terraform artifacts.

---

## 🧹 Step 2: Remove Tracked Files From Current Commit

For each file returned above:

```bash
git rm --cached "FULL/PATH/TO/FILE"
```

Example (note quoting due to `&` in folder name):

```bash
git rm --cached "Terraform&Aws/.../terraform-provider-aws_v6.28.0_x5"
```

Commit the cleanup:

```bash
git commit -m "Remove Terraform provider binaries from Git tracking"
```

⚠️ This **does not** remove the files from Git history.

---

## 🔥 Step 3: Remove `.terraform` From *All Git History* (Required)

Because the files existed in previous commits, GitHub still blocks the push.

### Install `git-filter-repo`

```bash
sudo apt update
sudo apt install git-filter-repo -y
```

Verify:

```bash
git filter-repo --version
```

---

### Rewrite History (Recommended Universal Fix)

From the repo root:

```bash
git filter-repo --force --path-glob "**/.terraform/**" --invert-paths
```

This:

* Removes **all `.terraform` directories**
* Applies to **every commit in history**
* Permanently deletes large provider binaries

---

## ✅ Step 4: Verify Repository Is Clean

Run **all** of these:

```bash
git log --all --name-only | grep terraform-provider
git log --all --name-only | grep '\.terraform'
git ls-files | grep terraform-provider
```

Expected result:

```
(no output)
```

---

## 🚀 Step 5: Force Push Clean History

```bash
git push origin main --force
```

GitHub should now accept the push successfully.

---

## 📌 Best Practices Going Forward

| Item                  | Commit to Git? |
| --------------------- | -------------- |
| `.tf` files           | ✅ Yes          |
| `.terraform/`         | ❌ Never        |
| Provider binaries     | ❌ Never        |
| `.terraform.lock.hcl` | ✅ Yes          |
| `terraform.tfstate`   | ❌ Never        |

---

## ⚠️ Important Naming Recommendation

Avoid special characters like `&` in directory names. They cause:

* Shell parsing bugs
* CI/CD failures
* Git command errors

### Recommended rename:

```bash
mv "Terraform&Aws" Terraform_Aws
git add .
git commit -m "Rename Terraform&Aws to Terraform_Aws"
git push
```

---

## 🎯 Key Lesson

> If a large file **ever** enters Git history, `.gitignore` is too late.
> You must **rewrite history** or start a new repository.

This is a normal, real-world DevOps issue — and now you know how to fix it properly.
