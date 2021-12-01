# @hack(nvm) hard-code path
BREW=$(brew --prefix)
export PATH=$BREW/opt/nvm/versions/node/v16.13.0/bin:$PATH
export NVM_DIR=~/.nvm
[[ -s "$BREW/opt/nvm/nvm.sh" ]] && source "$BREW/opt/nvm/nvm.sh" --no-use
