# Fix Git Push After Terraform Cleanup

This guide contains the **exact commands** needed to fix the Git errors you saw after removing `.terraform` files and rewriting history.

---

## 1. Check Current Git State

```bash
git status
git branch
git remote -v
```

If `git remote -v` shows **nothing**, you have no remote configured.

---

## 2. Add GitHub Remote Repository

```bash
git remote add origin https://github.com/bcho77/Devops_projects.git
```

Verify:

```bash
git remote -v
```

Expected output:

```text
origin  https://github.com/bcho77/Devops_projects.git (fetch)
origin  https://github.com/bcho77/Devops_projects.git (push)
```

---

## 3. Push the `main` Branch (Force Required)

Because Git history was rewritten, you **must force push**:

```bash
git push -u origin main --force
```

---

## 4. (Optional) Use SSH Instead of HTTPS

```bash
git remote set-url origin git@github.com:bcho77/Devops_projects.git
```

---

## 5. Final Sanity Checks

Ensure Terraform files are no longer tracked:

```bash
git ls-files | grep .terraform
```

Expected result: **no output**

---

## Key Rules to Remember

* Never commit `.terraform/`
* Never commit Terraform providers
* `.gitignore` only affects future commits
* Rewriting history removes remotes by design

---

## Correct Push Syntax (Mental Model)

```bash
git push <remote> <branch>
```

Example:

```bash
git push origin main
```
