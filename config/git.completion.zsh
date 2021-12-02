# Uses git's autocompletion for inner commands. Assumes an install of git's
# bash `git-completion` script at $completion below (this is where Homebrew
# tosses it, at least).

completion='$BREW_PREFIX/share/zsh/site-functions/_git'usr/local

if test -f $completion
then
  source $completion
fi
