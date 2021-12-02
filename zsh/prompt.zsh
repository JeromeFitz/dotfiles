autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

# # colors
# black
# blue
# cyan
# green
# magenta
# red
# white
# yellow

local COLOR_RESET="%{$reset_color%}"
local COLOR_GIT_DIRTY="%{$fg_bold[green]%}"
local COLOR_GIT_CLEAN="%{$fg_bold[red]%}"
local COLOR_DIRECTORY_NAME="%{$fg_bold[white]%}"
local COLOR_NEED_PUSH="%{$fg_bold[yellow]%}"
local COLOR_PREFIX="%{$fg_bold[white]%}"
local PREFIX_SYMBOL="▲"
local PREFIX="$COLOR_PREFIX$PREFIX_SYMBOL$COLOR_RESET"

if (( $+commands[git] ))
then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

git_branch() {
  echo $($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  if $(! $git status -s &> /dev/null)
  then
    echo ""
  else
    if [[ $($git status --porcelain) == "" ]]
    then
      echo "[$COLOR_GIT_DIRTY$(git_prompt_info)$COLOR_RESET]"
    else
      echo "[$COLOR_GIT_CLEAN$(git_prompt_info)$COLOR_RESET]"
    fi
  fi
}

git_prompt_info () {
 ref=$($git symbolic-ref HEAD 2>/dev/null) || return
# echo "(%{\e[0;33m%}${ref#refs/heads/}%{\e[0m%})"
 echo "${ref#refs/heads/}"
}

# This assumes that you always have an origin named `origin`, and that you only
# care about one specific origin. If this is not the case, you might want to use
# `$git cherry -v @{upstream}` instead.
need_push () {
  if [ $($git rev-parse --is-inside-work-tree 2>/dev/null) ]
  then
    COUNT=$($git cherry -v origin/$(git symbolic-ref --short HEAD) 2>/dev/null | wc -l | bc)

    if [[ $COUNT == 0 ]]
    then
      echo " "
    else
      echo " ($COLOR_NEED_PUSH$COUNT$COLOR_RESET) "
    fi
  fi
}

directory_name() {
  echo "$COLOR_DIRECTORY_NAME%1/%\\$COLOR_RESET"
}

# battery_status() {
#   if test ! "$(uname)" = "Darwin"
#   then
#     exit 0
#   fi

#   if [[ $(sysctl -n hw.model) == *"Book"* ]]
#   then
#     $ZSH/bin/battery-status
#   fi
# }

export PROMPT=$'$PREFIX $(directory_name) $(git_dirty)$(need_push)'

set_prompt () {
  export RPROMPT="%{$fg_bold[cyan]%}$COLOR_RESET"
}

precmd() {
  # does not allow us to ever change title dynamically
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
