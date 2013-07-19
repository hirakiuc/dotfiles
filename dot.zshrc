
if [ ${USER} = "root" ]
then
#  PROMPT="%{[31m%}[%n@%m]#%{[m%} "
  PROMPT="[%n@%m]$ "
  PATH=${PATH}:/sbin:/usr/sbin:/usr/local/sbin
else
  PROMPT="[%n@%m]$ "
fi

autoload -U compinit
compinit

# http://qiita.com/items/ed2d36698a5cc314557d
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separator-sections true

autoload colors
colors
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

fpath=(/usr/local/share/zsh-completions $fpath)

export PATH=/opt/local/bin/:/opt/local/sbin/:$PATH:$HOME/.bin
export MANPATH=/opt/local/man:$MANPATH
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

alias ls="ls -FG"
alias vim="/usr/local/bin/vim"
alias rakobjc="rak --type=objc"
alias zsh="/usr/local/bin/zsh"
alias mosh:sakura="mosh --ssh=\"ssh -p 30 -i ~/.ssh/id_rsa\" hirakiuc@49.212.131.202"
export LSCOLORS=gxfxcxdxbxegedabagacad

export JLESSCHARSET=japanese-utf8

alias irb="pry"
alias memcached="/usr/local/opt/memcached/bin/memcached"

source $HOME/.zsh/git-branch.zsh

bindkey "^P" up-line-or-history
bindkey "^N" down-line-or-history

if [ -f $HOME/.rvm/scripts/rvm ]
then
  source $HOME/.rvm/scripts/rvm
fi

