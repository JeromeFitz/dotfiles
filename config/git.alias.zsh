# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# The rest of my fun git aliases
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD'

# Remove `+` and `-` from start of diff lines; just rely upon color.
alias gd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'

alias ga.="git add ."
alias gcom="git commit"
alias gac="ga. && gcom"
alias gacp="ga. && gcom && ggp"
alias gsb='git status -sb'
alias gss='git status -s'

# $1 = remote name
# $2 = github name
# $3 = repo name
remote-add() {
  git remote add $1 git@github.com:$2/$3.git
}
# $1 = branch name
fetch-origin() { git checkout $1 && git fetch origin && git checkout $1 && git merge origin/$1 && ggp; }
# $1 = branch name
fetch-upstream() { git checkout $1 && git fetch upstream && git checkout $1 && git merge upstream/$1 && ggp; }

# ex) gcob JeromeFitz refactor/dotfiles
#  => git fetch JeromeFitz && git checkout refactor/dotfiles
gcob() {
    github=$1
    IFS=":"
    read -r remote branch <<< "$github"
    git fetch $remote && git checkout $branch && git pull $remote $branch
}
gradd() {
    github=$1
    IFS=":"
    read -r user repo <<< "$github"
    git remote add $user git@github.com:$user/$repo
}

squash() {
  git rebase -i HEAD~$1
}
