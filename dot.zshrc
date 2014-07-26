
if [ ${USER} = "root" ]
then
#  PROMPT="%{[31m%}[%n@%m]#%{[m%} "
  PROMPT="[%n@%m]$ "
  PATH=${PATH}:/sbin:/usr/sbin:/usr/local/sbin
else
  PROMPT="[%n@%m]$ "
fi

fpath=($(brew --prefix)/share/zsh-completions $fpath)
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
fpath=($HOME/.zsh/completions $fpath)

autoload -U compinit
compinit

# http://qiita.com/items/ed2d36698a5cc314557d
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separator-sections true

autoload colors
colors
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

alias ls="ls -FG"
alias vim="/usr/local/bin/vim"
alias rakobjc="rak --type=objc"
alias zsh="/usr/local/bin/zsh"
alias be="bundle exec"
alias memcached="/usr/local/opt/memcached/bin/memcached"

export LSCOLORS=gxfxcxdxbxegedabagacad
export JLESSCHARSET=japanese-utf8

for file in `ls $HOME/.zsh/functions/*.zsh`
do
  source $file
done

bindkey "^P" up-line-or-history
bindkey "^N" down-line-or-history

if [ -f $HOME/.rvm/scripts/rvm ]
then
  source $HOME/.rvm/scripts/rvm
fi

if [ -f $HOME/.zsh/antigen.zsh ]
then
  source $HOME/.zsh/antigen.zsh
fi
