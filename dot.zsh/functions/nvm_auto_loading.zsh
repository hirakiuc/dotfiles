# https://github.com/creationix/nvm#calling-nvm-use-automatically-in-a-directory-with-a-nvmrc-file
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    if [ `head -1 .nvmrc` == `node -v` ]; then
      nvm use
    else
      echo "Using node `head -1 .nvmrc`"
    fi
  fi
}
add-zsh-hook chpwd load-nvmrc
