#!/bin/bash

# Usage: ./init_worktree.sh <branch-name>
# Example: ./init_worktree.sh feat/scrip-tags

BASE_DIR=/path/to/base-worktree-dir
DEV_DIR="$BASE_DIR/project-main-branch-dir"

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <branch-name>"
    exit 1
fi

BRANCH=$1

# Generate worktree name: project-<branch-name> with '/' replaced by '-'
WORKTREE_PREFIX=project
WORKTREE_NAME="${WORKTREE_PREFIX}-${BRANCH//\//-}"
WORKTREE_PATH="$BASE_DIR/$WORKTREE_NAME"
WORKTREE_BACKEND="${WORKTREE_PATH}/backend" # keep this empty if the same was WORKTREE_PATH

# Check if branch exists locally
if git show-ref --verify --quiet "refs/heads/$BRANCH"; then
    echo "Branch '$BRANCH' exists locally. Using existing branch."
else
    echo "Branch '$BRANCH' does not exist. Creating new branch from current HEAD."
    git branch "$BRANCH"
fi

# Add git worktree
git worktree add "$WORKTREE_PATH" "$BRANCH" 

mkdir -p "$WORKTREE_BACKEND/logs"

# Add symbolic links to configs
ln -sfn "$DEV_DIR/.env" "$WORKTREE_BACKEND/"
ln -sfn "$DEV_DIR/CLAUDE.md" "$WORKTREE_BACKEND/"
ln -sfn "$DEV_DIR/.vscode" "$WORKTREE_BACKEND/.vscode"
ln -sfn "$DEV_DIR/.claude" "$WORKTREE_BACKEND/.claude"
ln -sfn "$DEV_DIR/.kiro" "$WORKTREE_BACKEND/.kiro"
ln -sfn "$DEV_DIR/.venv" "$WORKTREE_BACKEND/.venv"

echo "Worktree '$WORKTREE_NAME' created for branch '$BRANCH' with files copied."
