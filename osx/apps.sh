#!/usr/bin/env bash

declare -a CLI=(
  "ripgrep"
  "jq"
  "fzf"
  "htop"
  "tmux"
  "neovim"
  "lazygit"
  "antigen"
)

declare -a GUI=(
  "ghostty"
  "rectangle"
  "hammerspoon"
  "font-iosevka"
)

dry="0"
uninstall="0"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry) dry="1" ;;
    --uninstall) uninstall="1" ;;
  esac
  shift
done

action="install"
if [[ $uninstall == "1" ]]; then
  action="uninstall"
fi

log() {
  if [[ $dry == "1" ]]; then
    echo "[DRY RUN]: $*"
  else
    echo "$@"
  fi
}

execute() {
  log "executing $*"
  if [[ $dry == "1" ]]; then
    return
  fi
  "$@"
}

echo "===== apps.sh ====="

for app in "${CLI[@]}"; do
  execute brew "$action" "$app"
done

for app in "${GUI[@]}"; do
  execute brew "$action" "$app" --cask
done
