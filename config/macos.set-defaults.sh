# macOS defaults.
#
# The original idea (and a couple settings) were grabbed from:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.macos
#

# Switch to dark mode
osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to 1'

# # Disable press-and-hold for keys in favor of key repeat.
# defaults write -g ApplePressAndHoldEnabled -bool false

# # Use AirDrop over every interface.
# defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Always open everything in Finder's view like:
# # Flwv ▸ Cover Flow View
# # Nlsv ▸ List View
# # clmv ▸ Column View
# # icnv ▸ Icon View
defaults write com.apple.Finder FXPreferredViewStyle clmv

# Hide external drives or removeable media from the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# # Show the ~/Library folder.
# chflags nohidden ~/Library

# # Set a really fast key repeat.
# defaults write NSGlobalDomain KeyRepeat -int 1

# # Run the screensaver if we're in the bottom-left hot corner.
# # defaults write com.apple.dock wvous-bl-corner -int 5
# # defaults write com.apple.dock wvous-bl-modifier -int 0

# # Put the display to sleep if we're in the bottom-left hot corner
# defaults write com.apple.dock wvous-bl-corner -int 10
# defaults write com.apple.dock wvous-bl-modifier -int 0

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 36

# # Prevent changing the Dock size
# defaults write com.apple.dock size-immutable -bool true

# Place the Dock on screen: left|bottom|right
defaults write com.apple.dock orientation bottom

# Hide recent apps from Dock
defaults write com.apple.dock show-recents -bool false

# Hide Safari's bookmark bar.
defaults write com.apple.Safari ShowFavoritesBar -bool false

# Set up Safari for development.
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
