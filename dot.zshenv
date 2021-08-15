export GOPATH=$HOME/repos

typeset -U path PATH
path=(
  /opt/homebrew/bin(N-/)
  /usr/local/bin(N-/)
  $HOME/.bin(N-/)
  $path
  /opt/homebrew/opt/git/share/git-core/contrib/diff-highlight
  $GOPATH/bin(N-/)
)

export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

export XDG_CONFIG_HOME=$HOME/.config

# For kubectl in gcloud
export PATH=$PATH:$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin
