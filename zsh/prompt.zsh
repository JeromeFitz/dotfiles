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
local PROMPT_PREFIX_SYMBOL="▲"
local PROMPT_PREFIX="$COLOR_PREFIX$PROMPT_PREFIX_SYMBOL$COLOR_RESET"

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

export PROMPT=$'$PROMPT_PREFIX $(directory_name) $(git_dirty)$(need_push)'

set_prompt () {
  export RPROMPT="%{$fg_bold[cyan]%}$COLOR_RESET"
}

# #
# #
# ref: https://github.com/vercel/hyper/issues/1188#issuecomment-332606903
# #
# # Override auto-title when static titles are desired ($ title My new title)
title() { export TITLE_OVERRIDDEN=1; echo -en "\e]0;$*\a"}
# # Turn off static titles ($ autotitle)
autotitle() { export TITLE_OVERRIDDEN=0 }; autotitle
# Condition checking if title is overridden
overridden() { [[ $TITLE_OVERRIDDEN == 1 ]]; }

# Show cwd when shell prompts for input.
tabtitle_precmd() {
   if overridden; then return; fi
   pwd=$(pwd) # Store full path as variable
   cwd=${pwd##*/} # Extract current working dir only
   print -Pn "\e]0;$cwd\a" # Replace with $pwd to show full path
}
[[ -z $precmd_functions ]] && precmd_functions=()
precmd_functions=($precmd_functions tabtitle_precmd)

# Prepend command (w/o arguments) to cwd while waiting for command to complete.
tabtitle_preexec() {
   if overridden; then return; fi
   printf "\033]0;%s\a" "${1%% *} | $cwd" # Omit construct from $1 to show args
}
[[ -z $preexec_functions ]] && preexec_functions=()
preexec_functions=($preexec_functions tabtitle_preexec)
