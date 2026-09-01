#!/usr/bin/env bash
#
# Snapshot personal-vault's .obsidian config into dotfiles/obsidian/ for git backup.
# Skips bulky, redownloadable plugin/theme code and pure session state.
#
# Usage:
#   ./sync_obsidian_backup.sh            # snapshot
#   ./sync_obsidian_backup.sh --dry-run  # show what would change
#
set -euo pipefail

SRC="/home/pranjalpokharel/Documents/obsidian-vaults/personal-vault/.obsidian"
DST="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/obsidian"

DRY=""
[[ "${1:-}" == "--dry-run" ]] && DRY="--dry-run --itemize-changes"

mkdir -p "$DST"

rsync -a --delete $DRY \
  --exclude 'workspace.json' \
  --exclude 'workspace-mobile.json' \
  --exclude 'graph.json' \
  --exclude 'icons/' \
  --exclude 'plugins/*/main.js' \
  --exclude 'plugins/*/main.js.map' \
  --exclude 'plugins/*/styles.css' \
  --exclude 'themes/*/theme.css' \
  --exclude 'plugins/obsidian-local-rest-api/data.json' \
  "$SRC/" "$DST/"

echo "done. review with: git -C \"$(dirname "$DST")\" status"
