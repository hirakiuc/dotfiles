" gocode
set rtp+=$GOROOT/misc/vim
" golint
exe "set rtp+=" . globpath($GOPATH, "src/github.com/golang/lint/misc/vim")
