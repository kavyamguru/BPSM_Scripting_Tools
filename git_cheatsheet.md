# Basic setup
git config --global user.name "Your Name"
git config --global user.email "you@example.com"

# Repository setup
git init
git clone <url>

# Staging and committing
git add <file>
git commit -m "Commit message"

# Viewing history
git log --oneline --graph
git status
git diff

# Undo and revert
git reset HEAD <file>        # Unstage but keep changes
git checkout -- <file>       # Revert file to last commit
git rm --cached <file>       # Remove from repo, keep locally
git rm -r <dir>              # Remove directory fully

# Branching and merging
git branch <branchname>
git checkout <branchname>
git merge <branchname>

# Remote operations
git remote add origin <url>
git push -u origin main
git pull origin main

# Config tools
git config --list
git config merge.tool vimdiff
git config --global core.editor "nano -w"

