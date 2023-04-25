export NVM_DIR="$HOME/.nvm"
# 🚚️ moved to: sandboxrc.symlink

autoload -U add-zsh-hook
load-nvmrc() {
  local TYPE_NVM
  TYPE_NVM=$(type nvm)
  local TYPE_NVM_SANDBOX
  TYPE_NVM_SANDBOX="sandboxd.plugin.zsh"
  if [[ $TYPE_NVM =~ $TYPE_NVM_SANDBOX ]];
  then
      sandbox nvm
  fi

  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
