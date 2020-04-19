#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#EXPORTS
export QT_AUTO_SCREEN_SCALE_FACTOR=0 #boolean
export QT_SCALE_FACTOR=2.00
export QT_SCREEN_SCALE_FACTORS=2.00
#export QT_ENABLE_HIGHDPI_SCALING=1
export GDK_SCALE=2
export ELM_SCALE=2

alias spacman="sudo pacman -Sy"
alias rpacman="sudo pacman -R"
alias upacman="sudo pacman -Syu"
alias ppacman="sudo pacman -R $(pacman -Qdtq)"

alias yays="yay -S"
alias yayu="yay -Suy"
alias yayp="yay -Yc"
alias yayr="yay -Rns"

alias svim="sudo vim"

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

#GIT
alias gaa="git add ."
alias gs="git status"
alias gc="git commit -m"
alias gpm="git push origin master"

alias ll="ls -lath"
alias aur="makepkg -si"

alias mirru="sudo reflector --verbose -l 200 -n 20 -p http --sort rate --save /etc/pacman.d/mirrorlist"
alias xamppstart="sudo /opt/lampp/lampp start"
alias xamppstop="sudo /opt/lampp/lampp stop"
