# Path to your oh-my-zsh installation.
export ZSH=/home/serafim/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

COMPLETION_WAITING_DOTS="true"

plugins=(git archlinux django docker kubectl)

# Set up Node Version Manager
export NVM_DIR="$HOME/.nvm"                            # You can change this if you want.
export NVM_SOURCE="/usr/share/nvm"                     # The AUR package installs it to here.
[ -s "$NVM_SOURCE/nvm.sh" ] && . "$NVM_SOURCE/nvm.sh"  # Load NVM

export PATH="$HOME/.config/bspwm:/home/serafim/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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
export PATH="$HOME/.linuxbrew/bin:$PATH"
function exists { which $1 &> /dev/null }

if exists percol; then
    function percol_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }

    zle -N percol_select_history
    bindkey '^R' percol_select_history
fi

if exists nvm; then
	nvm use stable
fi
