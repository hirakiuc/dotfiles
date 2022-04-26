# https://github.com/creationix/nvm#calling-nvm-use-automatically-in-a-directory-with-a-nvmrc-file
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    if [ "v`head -1 .nvmrc`" != `node -v` ]; then
      nvm use --delete-prefix
    else
      echo "Using node `head -1 .nvmrc`"
    fi
  fi
}
add-zsh-hook chpwd load-nvmrc
