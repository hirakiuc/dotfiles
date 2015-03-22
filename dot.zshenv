export PATH=$HOME/.rbenv/shims:$PATH
export PATH=/usr/local/bin:$PATH:$HOME/.bin
export PATH=$PATH:$(brew --prefix git)/share/git-core/contrib/diff-highlight
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

export GOPATH=$HOME/.golang
export PATH=$PATH:$GOPATH/bin

[[ -s $HOME/.nvm/nvm.sh ]] && source $HOME/.nvm/nvm.sh
