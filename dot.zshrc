fpath=($(brew --prefix)/share/zsh-completions $fpath)
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
fpath=($HOME/.zsh/completions $fpath)

autoload -U compinit
compinit -u

# http://qiita.com/items/ed2d36698a5cc314557d
zstyle ':completion:*' verbose yes
zstyle ':completion:*' format '%B%d%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''
#zstyle ':completion:*:manuals' separator-sections true
zstyle ':completion:*:commands' rehash 1

autoload colors
colors
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

export LSCOLORS=gxfxcxdxbxegedabagacad
export JLESSCHARSET=japanese-utf8
export EDITOR=/usr/local/bin/vim
export HISTSIZE=1000

setopt hist_ignore_dups

eval "$(direnv hook zsh)"

# Load rbenv automatically by appending
# the following to ~/.zshrc:
eval "$(rbenv init - zsh)"
export PATH=$HOME/.rbenv/shims:$PATH

# Enable antigen
source $HOME/.zsh/antigen.zsh

# Load custom codes.
for file in `ls $HOME/.zsh/functions/*.zsh`
do
  source $file
done

bindkey -e
bindkey "^P" up-line-or-history
bindkey "^N" down-line-or-history

if [ -f $HOME/.rvm/scripts/rvm ]
then
  source $HOME/.rvm/scripts/rvm
fi

if [ -f /usr/local/share/zsh/site-functions/_aws ]
then
  source /usr/local/share/zsh/site-functions/_aws
fi

if [ -f $HOME/.embulk/bin/embulk ]
then
  export PATH=$HOME/.embulk/bin:$PATH
fi

alias ls="ls -FG"
alias vim="/usr/local/bin/vim"
alias rakobjc="rak --type=objc"
alias zsh="/usr/local/bin/zsh"
alias be="bundle exec"
alias memcached="/usr/local/opt/memcached/bin/memcached"
alias mux=$(rbenv which tmuxinator)

# added by travis gem
[ -f /Users/hirakiuc/.travis/travis.sh ] && source /Users/hirakiuc/.travis/travis.sh
