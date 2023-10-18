alias reload!='. ~/.zshrc'

alias cls='clear'

alias dotfiles='cd ~/.dotfiles'
alias dotfilesc='dotfiles && code .'

alias getGitConfig='echo "[ git ] 📛  user.name:       $(git config --get user.name)" && echo "[ git ] 📧  user.email:      $(git config --get user.email)" && echo "[ git ] 🔑  user.signingkey: $(git config --get user.signingkey)"'

# @note(to-be-removed) Issue with MacOS Monterrey
# @note(feature) Should this be CRON?
alias refreshOutlook='launchctl stop com.apple.CalendarAgent && launchctl start com.apple.CalendarAgent'

alias spotlightOff="sudo mdutil -a -i off"
alias spotlightOn="sudo mdutil -a -i on"
