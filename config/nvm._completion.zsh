autoload -Uz compinit
compinit -i

# nvm: completions
# echo "NVM completions PLEASE JFC"
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"
