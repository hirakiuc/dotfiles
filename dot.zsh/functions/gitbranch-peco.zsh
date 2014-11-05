#

# http://qiita.com/ymorired/items/1772d3112573179b68cb
function peco-gitbranch() {
  local current_buffer=$BUFFER

  local selected_line="$(git for-each-ref --format='%(refname:short) | %(committerdate:relative) | %(committername) | %(subject)' --sort=-committerdate refs/heads refs/remotes \
    | column -t -s '|' \
    | peco \
    | head -n 1 \
    | awk '{print $1}')"
  if [ -n "$selected_line" ]; then
    BUFFER="${current_buffer} ${selected_line}"
    CURSOR=$#BUFFER
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-gitbranch
bindkey '^x^b' peco-gitbranch
