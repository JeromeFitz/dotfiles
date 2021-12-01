#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "› 🍺️ homebrew installation"
  # Install the correct homebrew for each OS type
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Upgrade homebrew
echo "› 🍺️ brew update ..."
brew update

# Install brew packages
echo "› 🍺️ installing..."
brew bundle --file ./Brewfile | indent

# Custom dumb stuff until I port this out
echo "› 🚨️ linting..."
yarn lint:fix

echo

exit 0
