# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias lls="gls -al --color"
  alias la='gls -A --color'
fi

alias ..='cd ..'
alias ...='cd ../..'
alias mkdir='mkdir -p'
alias ~='cd ~'
alias /='cd /'
alias path='echo $PATH | tr -s ":" "\n"'

alias uuid="uuidgen | tr '[:upper:]' '[:lower:]'"
alias UUID="uuidgen"
