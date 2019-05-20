export PATH=/usr/local/bin:$PATH:$HOME/.bin
export PATH=$PATH:$(brew --prefix git)/share/git-core/contrib/diff-highlight

# for mercari-mini3
export PATH=/usr/local/opt/python/libexec/bin:$PATH

export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

export GOPATH=$HOME/repos
export PATH=$PATH:$GOPATH/bin

export XDG_CONFIG_HOME=$HOME/.config

# For kubectl in gcloud
export PATH=$PATH:/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin
