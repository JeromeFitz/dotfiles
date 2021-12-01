if test ! "$(uname)" = "Darwin"
  then
  exit 0
fi

# The Brewfile handles Homebrew-based app and library installs, but there may
# still be updates and installables in the Mac App Store.

echo "› 🍎️ sudo softwareupdate -i -a"
sudo softwareupdate -i -a
