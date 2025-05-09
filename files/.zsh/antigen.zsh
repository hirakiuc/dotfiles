source $(brew --prefix)/share/antigen/antigen.zsh

antigen use oh-my-zsh

# Bundles from the detault repo
antigen bundle git
antigen bundle heroku
antigen bundle bundler
antigen bundle git-flow
antigen bundle rbenv
antigen bundle zsh-users/zsh-completions src
antigen bundle jocelynmallon/zshmarks
antigen bundle greymd/docker-zsh-completion
antigen bundle gpg-agent
antigen bundle mroth/evalcache

export NVM_LAZY_LOAD=true
antigen bundle lukechilds/zsh-nvm

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme
#antigen theme robbyrussell

# Tell antigen that you're done.
antigen apply
