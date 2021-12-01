# nvm
alias node12="nvm use 12 && nvm alias default 12"
alias node14="nvm use 14 && nvm alias default 14"
alias node16="nvm use 16 && nvm alias default 16"

# ref: https://dev.to/trilon/how-to-delete-all-nodemodules-folders-on-your-machine-43dh
alias listNodeModules="find . -name 'node_modules' -type d -prune -print | xargs du -chs"
alias wipeNodeModules="find . -name 'node_modules' -type d -prune -print -exec rm -rf '{}' \;"
