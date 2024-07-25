#!/bin/bash

# Update all submodules to the latest commit on their current branch
git submodule update --remote --merge

# Add changes to the main repository
git add .

# Commit changes with a generic message
git commit -m "Updated submodules to their latest commits"

# Push changes to the remote repository
git push

# Unstow and restow each package
stow -D */ # Unstow all packages
stow */   # Restow all packages

echo "All submodules have been updated and symlinks refreshed."
