# oh my zsh
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="eastwood"
HYPHEN_INSENSITIVE="true"
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
source $ZSH/oh-my-zsh.sh

# path
export PATH=$PATH:/home/emerald/.local/bin:/opt/:/home/emerald/Applications/:/opt/nvim-linux-x86_64/bin

# git
alias gc="git clone"

alias cpr="cd ~/Documents/project_s" # projects directory in home directory
alias npr="cd /media/emerald/ssd2/projects" # projects directory in external volume
alias dwa="yt-dlp -x --audio-format 'aac' --output \"%(title)s.%(ext)s\"" # download audio
alias python3="/usr/bin/python3.11" # ubuntu problems :(
alias notes="nvim ~/Documents/private-vault" # previously obsidian vault

# pwn college
alias pwn="ssh -i ~/.ssh/pwn_key hacker@pwn.college"

# node version manager (ubuntu problems again)
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "/media/emerald/ssd2/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# neovim
export EDITOR="nvim"
alias conf="nvim ~/.config/nvim" # open neovim config

# open nvim with title set correctly to directory name
nvim_with_title() {
  local dir="$(basename "$PWD")"
  print -Pn "\e]0;$dir\a"
  command nvim "$@"
}
alias .="nvim_with_title ."

# bitcoind (absolute path subject to change)
alias bitcoind="/media/emerald/ssd2/projects/bitcoin-build/src/bitcoind"
alias bitcoin-cli="/media/emerald/ssd2/projects/bitcoin-build/src/bitcoin-cli"

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# needed by OBS for screen record in wayland
export QT_QPA_PLATFORM=wayland

