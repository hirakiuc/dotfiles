function peco-dir-open-app () {
  local findpath='.'
  if [ -n "$1" ]; then
    findpath="$1"
  fi

  local selected_files=`find $findpath | peco`

  if [ -z "$selected_files" ]; then
    return
  fi

  echo "$selected_files" | xargs sh -c 'vim "$0" < /dev/tty'
}
alias vim-peco=peco-dir-open-app
