#
# ~/.bashrc
#

source ./bashrc.backup

### Archlinux specific ###

# If not running interactively, don't do anything
#[[ $- != *i* ]] && return
#[[ -z "$TMUX" ]] && exec tmux

# Temporary workaround
#[ -f ~/.xprofile ] && . ~/.xprofile

#alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '

#PACMAN & YAOURT
alias aur="makepkg -si"
alias spacman="sudo pacman -Sy"
alias rpacman="sudo pacman -R"
alias upacman="sudo pacman -Syu"
alias ppacman="sudo pacman -R $(pacman -Qdtq)"
alias pcache="sudo paccache -r"

alias yays="yay -S"
alias yayu="yay -Suy"
alias yayp="yay -Yc"
alias yayr="yay -Rns"

#GRUB
alias grubmkc="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias mountefi="sudo mount /dev/nvme0n1p2 /boot/efi"
alias grubinst="sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB"
alias grubup="mountefi && sudo os-prober && grubmkc && grubinst"

#SYSTEMCTL
alias sysena="sudo systemctl enable"
alias systar="sudo systemctl start"
alias sysdis="sudo systemctl disable"
alias systop="sudo systemctl stop"

alias mirru="sudo reflector --verbose -l 200 -n 20 -p http --sort rate --save /etc/pacman.d/mirrorlist"

### General Purpose ###

#GIT
alias gaa="git add ."
alias gs="git status"
alias gd="git diff"
alias gc="git commit -m"
alias gpm="git push origin master"

#XAMPP
alias xamppstart="sudo /opt/lampp/lampp start"
alias xamppstop="sudo /opt/lampp/lampp stop"

#ORPHANS
alias svim="sudo vim"
alias ll="ls -lath"
alias treee="tree -I '.git' -a $1"
