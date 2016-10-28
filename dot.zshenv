export PATH=/usr/local/bin:$PATH:$HOME/.bin
export PATH=$PATH:$(brew --prefix git)/share/git-core/contrib/diff-highlight
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

export GOPATH=$HOME/repos
export PATH=$PATH:$GOPATH/bin

# for nvm (https://github.com/creationix/nvm)
[[ -s $HOME/.nvm/nvm.sh ]] && source $HOME/.nvm/nvm.sh
