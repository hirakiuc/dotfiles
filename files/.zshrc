fpath=($(brew --prefix)/share/zsh-completions $fpath)
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
fpath=($HOME/.zsh/completions $fpath)
fpath=($(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc $fpath)

autoload -Uz compinit && compinit -i

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
export EDITOR=$(brew --prefix)/bin/vim

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

# Enable antigen
source $HOME/.zsh/antigen.zsh

# Load custom codes.
for file in `find $HOME/.zsh/functions/*.zsh -type lf`
do
  source $file
done

# rust
if [ -f $HOME/.cargo/env ]
then
  source $HOME/.cargo/env
fi

bindkey -e
bindkey "^P" up-line-or-history
bindkey "^N" down-line-or-history

if [ -f /usr/local/share/zsh/site-functions/_aws ]
then
  source /usr/local/share/zsh/site-functions/_aws
fi

if [ -f $HOME/.embulk/bin/embulk ]
then
  export PATH=$HOME/.embulk/bin:$PATH
fi

alias ls="ls -FG"
alias vim="$(brew --prefix)/bin/nvim"
alias vvim="$(brew --prefix)/bin/vim"
alias rakobjc="rak --type=objc"
alias zsh="$(brew --prefix)/bin/zsh"
alias be="bundle exec"
alias memcached="/usr/local/opt/memcached/bin/memcached"

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

# google-cloud-sdk
if [ -f "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc" ]; then
  . $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
fi

# gh
[ -f $(brew --prefix)/bin/gh ] && eval "$(gh completion -s zsh)"

# gvm
[[ -s "${HOME}/.gvm/scripts/gvm" ]] && source "${HOME}/.gvm/scripts/gvm"
