alias reload!='. ~/.zshrc'

alias cls='clear'

alias dotfiles='cd ~/.dotfiles'
alias dotfilesc='dotfiles && code .'

alias getGitConfig='echo "[ git ] 📛  user.name:  $(git config --get user.name)" && echo "[ git ] 📧  user.email: $(git config --get user.email)"'

# @note(to-be-removed) Issue with MacOS Monterrey
# @note(feature) Should this be CRON?
alias refreshOutlook='launchctl stop com.apple.CalendarAgent && launchctl start com.apple.CalendarAgent'
