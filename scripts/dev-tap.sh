#!/usr/bin/env bash
# Point the installed moreiraeugenio/keycache tap at this working copy so
# `brew` picks up uncommitted cask edits, and restore it afterwards.
#
# Usage: scripts/dev-tap.sh link|unlink|status
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
tap_dir="$(brew --repository)/Library/Taps/moreiraeugenio/homebrew-keycache"
backup_dir="${tap_dir}.bak"

status() {
  if [[ -L "$tap_dir" ]]; then
    echo "linked: $tap_dir -> $(readlink "$tap_dir")"
  elif [[ -d "$tap_dir" ]]; then
    echo "not linked: $tap_dir is the regular tap"
  else
    echo "not tapped: $tap_dir does not exist"
  fi
}

link() {
  if [[ -L "$tap_dir" ]]; then
    echo "already linked -> $(readlink "$tap_dir")"
    return
  fi
  if [[ -e "$backup_dir" ]]; then
    echo "error: $backup_dir already exists; remove it or run unlink first" >&2
    exit 1
  fi

  mkdir -p "$(dirname "$tap_dir")"
  if [[ -d "$tap_dir" ]]; then
    mv "$tap_dir" "$backup_dir"
    echo "backed up tap to $backup_dir"
  fi
  ln -s "$repo_dir" "$tap_dir"
  echo "linked $tap_dir -> $repo_dir"
}

unlink() {
  if [[ ! -L "$tap_dir" ]]; then
    echo "not linked; nothing to do"
    return
  fi

  rm "$tap_dir"
  if [[ -d "$backup_dir" ]]; then
    mv "$backup_dir" "$tap_dir"
    echo "restored original tap"
  else
    echo "removed link; no backup found, run: brew tap moreiraeugenio/keycache"
  fi
}

case "${1:-}" in
  link) link ;;
  unlink) unlink ;;
  status) status ;;
  *)
    echo "usage: $0 link|unlink|status" >&2
    exit 1
    ;;
esac
