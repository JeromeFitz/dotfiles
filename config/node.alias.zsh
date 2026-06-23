# fnm
alias node12="fnm use 12 && fnm default 12"
alias node14="fnm use 14 && fnm default 14"
alias node16="fnm use 16 && fnm default 16"
alias node18="fnm use 18 && fnm default 18"
alias node20="fnm use 20 && fnm default 20"
alias node22="fnm use 22 && fnm default 22"
alias node24="fnm use 24 && fnm default 24"

# ref: https://dev.to/trilon/how-to-delete-all-nodemodules-folders-on-your-machine-43dh
alias listNodeModules="find . -name 'node_modules' -type d -prune -print | xargs du -chs"
alias wipeNodeModules="find . -name 'node_modules' -type d -prune -print -exec rm -rf '{}' \;"
