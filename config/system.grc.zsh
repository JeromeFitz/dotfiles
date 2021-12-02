# GRC colorizes nifty unix tools all over the place
if (( $+commands[grc] )) && (( $+commands[brew] ))
then
  source $BREW_PREFIX/etc/grc.bashrc
fi
