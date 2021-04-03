# Path to your oh-my-zsh installation.
export ZSH="/home/blaze/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="eastwood"
source $ZSH/oh-my-zsh.sh
export TERM=xterm-256color

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# aliases
alias mp=mousepad
alias nv="cd /run/media/blaze/New\ Volume"

# crr = current read directory
# cpr = current project directory
alias cpr="cd ~/Documents/projects_s"
alias crr="cd /run/media/blaze/New\ Volume/Study\ Semester/sem\ 4/applied\ maths/"

# redshift aliases
alias rs="redshift -O 3500"
alias rx="redshift -x"

# custom scripts, can be found in the pranjalpokharel7/campus-bash repository
alias swt="~/Scripts/switch"
alias login="~/Scripts/internet_login.sh"

# utility aliases
alias dwa="youtube-dl -x --audio-format 'aac' --output \"%(title)s.%(ext)s\""
alias pnv="mpv --no-video"
alias pg="ping www.google.com"
alias vf="vifm ." # opens vifm in the current directory as opposed to root

# export flutter root directory as path
export FLUTTER_HOME=~/flutter
export PATH=$FLUTTER_HOME/bin:$PATH

# current working flask directory
export FLASK_APP=~/Documents/projects/flask_interface/home_page.py
export FLASK_ENV=development
