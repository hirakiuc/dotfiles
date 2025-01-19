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

alias ls="ls -FG"
alias vim="$(brew --prefix)/bin/nvim"
alias zsh="$(brew --prefix)/bin/zsh"
alias be="bundle exec"

# google-cloud-sdk
if [ -f "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc" ]; then
  . $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
fi

# direnv
if builtin command -v direnv > /dev/null; then
  _evalcache direnv hook zsh
fi
#eval "$(direnv hook zsh)"

# rbenv
export RBENV_ROOT=$HOME/.rbenv/
# export PATH=$PATH:$HOME/.rbenv/bin
# Load rbenv automatically by appending
# the following to ~/.zshrc:
# eval "$(rbenv init - zsh)"
export PATH=$HOME/.rbenv/shims:$PATH

if builtin command -v rbenv > /dev/null; then
  # cache the rbenv
  _evalcache rbenv init - zsh
fi

# gh
if builtin command -v gh > /dev/null; then
  _evalcache gh completion -s zsh
fi

# helm
if builtin command -v helm > /dev/null; then
  _evalcache helm completion zsh
fi

# ct
if builtin command -v ct > /dev/null; then
  _evalcache ct completion zsh
fi
