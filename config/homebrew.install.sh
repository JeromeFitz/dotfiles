#!/bin/sh
#
# Homebrew: Installs some of the common dependencies required
#

BREWFILE_TYPE=$1

echo "› 🍺️ $BREWFILE_TYPE"

setup_zprofile () {
  # @note(zprofile) need to re-run symlinks for Apple Silicon
  info "› 🍺️ homebrew: zprofile"
  if [[ -f "/opt/homebrew/bin/brew" ]];
  then
    info "› 🍺️ homebrew: 🍏️ Apple Silicon"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $DOTFILES_ROOT/symlinks/zprofile.symlink
  else
    info "› 🍺️ homebrew: 💽️ Apple Intel"
    echo 'eval "$(/usr/local/bin/brew shellenv)"' >> $DOTFILES_ROOT/symlinks/zprofile.symlink
  fi
}

init_xcode () {
  # @note(xcode) cli tools => Can we do this from brew?
  info "› 🍺️ homebrew: 🔨️ xcode => apple command line tools"
  xcode-select --install
}

# Check for Homebrew
if test ! $(which brew)
then
  # @note(bootstrap) *should* only run during `bootstrap`
  #                  *will* have functions available to it
  echo "› 🍺️ homebrew installation"
  # Install the correct homebrew for each OS type
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  setup_zprofile

  info "› 🍺️ homebrew: re-run symlinks"
  # @note(./scripts/boostrap)
  install_dotfiles

  init_xcode

fi

echo "› 🍺️ update"
brew update

echo "› 🍺️ installing"
brew bundle --file ./$BREWFILE_TYPE | indent

echo "› 🍺️ analytics"
brew analytics off

echo "› 🚨️ linting..."
pnpm run lint:fix

echo

exit 0
