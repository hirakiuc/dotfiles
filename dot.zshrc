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

# To fix the error messages from vim on launching time
export LC_ALL=en_US.UTF-8

# Share the command histories between multi terminals
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt hist_ignore_all_dups # delete duplicated command from older one.
setopt hist_ignore_dups     # don't append history if it's same with the previous one.
setopt share_history        # Share the command history 
setopt append_history       # Just add history (not create new history file)
setopt inc_append_history   # Add history incrementaly
setopt hist_no_store        # don't append history command
setopt hist_reduce_blanks

eval "$(direnv hook zsh)"

# export RBENV_ROOT=$HOME/.rbenv/
# export PATH=$PATH:$HOME/.rbenv/bin
# Load rbenv automatically by appending
# the following to ~/.zshrc:
# eval "$(rbenv init - zsh)"
# export PATH=$HOME/.rbenv/shims:$PATH

# for nvm (https://github.com/creationix/nvm)
export NVM_DIR=$HOME/.nvm
[[ -s "$(brew --prefix nvm)/nvm.sh" ]] && source "$(brew --prefix nvm)/nvm.sh"

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
alias vim="/usr/local/bin/nvim"
alias vvim="/usr/local/bin/vim"
alias rakobjc="rak --type=objc"
alias zsh="/usr/local/bin/zsh"
alias be="bundle exec"
alias memcached="/usr/local/opt/memcached/bin/memcached"
# alias mux=$(rbenv which tmuxinator)

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

if [ -f "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc" ]; then
  . $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
fi
if [ -f "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc" ]; then
  . $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
fi
