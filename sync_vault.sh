#!/bin/bash

# Navigate to your Vault directory
cd /Users/sam/Vault

# Stage all changes
git add .

# Commit with a timestamp (only if there are changes)
if ! git diff-index --quiet HEAD --; then
    git commit -m "Weekly vault backup: $(date +'%Y-%m-%d %H:%M:%S')"
    # Push to GitHub (assuming you've set up 'origin main')
    git push origin main
fi
