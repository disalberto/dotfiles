#
# ~/.bashrc
#

### General Purpose ###

#GIT
alias gaa="git add ."
alias gb="git branch"
alias gbd="git branch -D $1"
alias gcb="git checkout -b $1"
alias gs="git status"
alias gd="git diff"
alias gc="git commit -m $1"
alias gca="git commit --amend --no-edit"
alias gp="git push origin $1"
alias gpf="git push -f origin $1"
alias gpm="git push origin master"

#XAMPP
alias xamppstart="sudo /opt/lampp/lampp start"
alias xamppstop="sudo /opt/lampp/lampp stop"

#ORPHANS
alias svim="sudo vim"
alias ll="ls -lath"
alias treee="tree -I '.git' -a $1"

alias wgetnocheck="wget --no-check-certificate -qO $1"

alias bz2="tar jvxf $1"
