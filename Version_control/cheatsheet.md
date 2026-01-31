# Git Cheatsheet

## Git Basics

```bash
git --version                  # Show Git version
git help                       # Git help
git help commit                # Help for specific command
```

## Repository Setup

```bash
git init                       # Initialize new repository
git clone <repo_url>           # Clone repository
git clone -b branch <repo_url> # Clone specific branch
```

## Configuration

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --list              # Show config
```

## Status & Tracking

```bash
git status                     # Show status
git status -s                  # Short status
git add file.txt               # Stage file
git add .                      # Stage all changes
git restore file.txt           # Discard changes
git restore --staged file.txt  # Unstage file
```

## Commit History

```bash
git commit -m "message"        # Commit changes
git commit -am "message"       # Add & commit tracked files
git log                        # Commit history
git log --oneline --graph      # Compact history
git show <commit>              # Show commit details
```

## Branching

```bash
git branch                     # List branches
git branch new-branch          # Create branch
git checkout new-branch        # Switch branch
git checkout -b new-branch     # Create & switch
git switch main                # Switch branch (new syntax)
git branch -d branch           # Delete branch
```

## Merging & Rebasing

```bash
git merge branch               # Merge branch into current
git rebase main                # Rebase current branch
git rebase --abort             # Abort rebase
git rebase --continue          # Continue rebase
```

## Remote Repositories

```bash
git remote -v                  # Show remotes
git remote add origin <url>    # Add remote
git fetch                      # Fetch updates
git pull                       # Fetch & merge
git push origin main           # Push to remote
git push -u origin main        # Set upstream
git config pull.rebase false  # merge (the default strategy)
git config pull.rebase true   # rebase
git config pull.ff only       # fast-forward only
```

## Tags

```bash
git tag                        # List tags
git tag v1.0                   # Create tag
git tag -a v1.0 -m "release"  # Annotated tag
git push origin v1.0           # Push tag
git push --tags                # Push all tags
```

## Stash

```bash
git stash                      # Stash changes
git stash list                 # List stashes
git stash apply                # Apply stash
git stash pop                  # Apply & remove stash
git stash drop                 # Delete stash
```

## Undo & Recovery

```bash
git reset --soft HEAD~1        # Undo commit (keep changes)
git reset --hard HEAD~1        # Undo commit (discard changes)
git revert <commit>            # Revert commit safely
git reflog                     # Show reference log
```

## Diff & Comparison

```bash
git diff                       # Working tree diff
git diff --staged              # Staged diff
git diff branch1 branch2       # Branch comparison
```

## Cleanup & Maintenance

```bash
git clean -f                   # Remove untracked files
git gc                         # Garbage collection
git fsck                       # Repository check
```

## Typical Workflow

```bash
git clone <repo>
git checkout -b feature
git add .
git commit -m "feature"
git push -u origin feature



git rm -r --cached Terraform\&Aws/terraform-aws-services-modules/**/.terraform

```

---

*This Git cheatsheet covers the most frequently used commands for daily development and DevOps workflows.*
