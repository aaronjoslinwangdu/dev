#!/usr/bin/env bash

dry="0"

while [[ $# -gt 0 ]]; do
  if [[ $1 == "--dry" ]]; then
    dry="1"
  else
    filter="$1"
  fi
  shift
done

log() {
  if [[ $dry == "1" ]]; then
    echo "[DRY RUN]: $@"
  else
    echo "$@"
  fi
}

execute() {
  log "executing $@"
  if [[ $dry == "1" ]]; then
    return
  fi
  "$@"
}

copy_dir() {
  from=$1
  to=$2

  pushd $from > /dev/null

  dirs=$(find . -mindepth 1 -maxdepth 1 -type d)
  for dir in $dirs; do
    execute rm -rf $to/$dir
    execute cp -r $dir $to/$dir
  done

  popd > /dev/null
}

copy_file() {
  from=$1
  to=$2
  name=$(basename $from)

  execute rm $to/$name
  execute cp $from $to/$name
}

replace_and_append_delimited_file() {
  from=$1
  to=$2
  name=$(basename $from)
  out=$to/$name

  if [[ -f $out ]]; then
    delim_start="# --- dev-env config start ---"
    delim_end="# --- dev-env config end ---"

    start=$(grep -n "^$delim_start" "$out" | sed -En 's/^([0-9]+):.*/\1/p')
    end=$(grep -n "^$delim_end" "$out" | sed -En 's/^([0-9]+):.*/\1/p')

    if [[ -n $start && -n $end && $start -lt $end ]]; then
      log "config section found, creating $out.bkp and overwriting $out"
      execute sed -i.bkp "$start,${end}d" "$out"
    fi
  fi

  log "appending config section to $out"
  if [[ $dry == "0" ]]; then
    # can't use execute here because the execute output gets sent to $out??
    cat "$name" >> "$out"
  fi
}

pushd $HOME/personal/dev/osx/dotfiles > /dev/null

copy_dir .config ~/.config
copy_file .tmux.conf ~
copy_dir .hammerspoon ~
replace_and_append_delimited_file .zshrc ~

popd > /dev/null
