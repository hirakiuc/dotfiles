# https://gist.github.com/3136632
#
# Show branch name in Zsh's right prompt
#

autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null

setopt prompt_subst

function rprompt-git-current-branch
{
  local name st color gitdir action
  if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
    return
  fi
  name=`git rev-parse --abbrev-ref=loose HEAD 2> /dev/null`
  if [[ -z $name ]]; then
    return
  fi

  gitdir=`git rev-parse --git-dir 2> /dev/null`
  action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"

  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
                color=%F{green}
  elif [[ -n `echo "$st" | grep "^no changes added"` ]]; then
                color=%F{yellow}
  elif [[ -n `echo "$st" | grep "^# Changes to be committed"` ]]; then
                color=%B%F{red}
        else
                color=%F{red}
        fi

        echo "$color$name$action%f%b "
}

function rprompt-git-path
{
  echo $(pwd | sed -e "s,^$(ghq root)/,ghq:,")
}

RPROMPT='[`rprompt-git-current-branch``rprompt-git-path`]'
