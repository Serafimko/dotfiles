# Path to your oh-my-zsh installation.
export ZSH=/home/serafim/.oh-my-zsh
source /usr/share/zsh/share/antigen.zsh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

COMPLETION_WAITING_DOTS="true"

plugins=(git archlinux django docker percol)

antigen use oh-my-zsh
antigen bundle soimort/translate-shell
antigen apply
# Set up Node Version Manager
export NVM_DIR="$HOME/.nvm"                            # You can change this if you want.
export NVM_SOURCE="/usr/share/nvm"                     # The AUR package installs it to here.
[ -s "$NVM_SOURCE/nvm.sh" ] && . "$NVM_SOURCE/nvm.sh"  # Load NVM

export PATH="$HOME/.config/bspwm:/home/serafim/bin:/opt/openresty/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/serafim/.nvm/versions/node/v10.15.2/bin/yarn"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
. /usr/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

export EDITOR="/usr/bin/vim"
export TERMINAL="/usr/bin/terminator"

alias ls='ls++'
alias lsm='ls -la --color=auto --block-size=M'
alias lsk='ls -la --color=auto --block-size=K'
alias mux='tmuxinator'

alias sshs='ssh serafim@serafimko.cf'
alias smon='ssh ma@mon'
alias score='ssh ma@192.168.22.195'
alias ssup='ssh ma@support.miran.ru'

alias newsboat='newsboat -C ~/.config/.newsboat'
alias sysupg='sh ~/.config/i3/scripts/update.sh'
alias pycharm='sh ~/pycharm/bin/pycharm.sh'
alias stproj='sh ~/.config/i3/scripts/mkproject.sh'
alias glola="git log --graph --abbrev-commit --decorate --format=format:'%C(bold red)%h%C(reset) - %C(bold cyan)%ad%C(reset) %C(green)(%ar)%C(reset) %C(bold yellow)%d%C(reset) %C(white)%s%C(reset) %C(dim white)- %C(bold blue)<%an>%C(reset)' --all --date=format:'%d-%m-%Y %H:%M'"
alias xclip='xclip -selection c'
alias bc='bc -l'
alias maimw='maim -i $(xdotool getactivewindow) ~/Pictures/window.jpg'
export PATH="$HOME/.linuxbrew/bin:$PATH"

# source "/home/serafim/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
fpath=($fpath "/home/serafim/.zfunctions")

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship
nvm use stable
