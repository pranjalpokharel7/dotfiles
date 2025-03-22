export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="eastwood"
HYPHEN_INSENSITIVE="true"
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:/home/emerald/.local/bin:/opt/:/home/emerald/Applications/
export EDITOR='nvim'

alias gc="git clone"
alias vim='nvim'

alias cpr="cd ~/Documents/project_s"
alias cdr="cd ~/Documents/project_s/naamche/realpha-data-repository/"
alias npr="cd /media/emerald/ssd2/projects"
alias dwa="yt-dlp -x --audio-format 'aac' --output \"%(title)s.%(ext)s\""
alias python3="/usr/bin/python3.11"

alias pwn="ssh -i ~/.ssh/pwn_key hacker@pwn.college"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "/media/emerald/ssd2/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

alias .="nvim ."

# bitcoind (configure paths)
alias bitcoind="/media/emerald/ssd2/projects/bitcoin-build/src/bitcoind"
alias bitcoin-cli="/media/emerald/ssd2/projects/bitcoin-build/src/bitcoin-cli"

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion