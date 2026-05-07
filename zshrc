# oh my zsh
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="eastwood"
HYPHEN_INSENSITIVE="true"
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

source $ZSH/oh-my-zsh.sh

# path
export PATH=$PATH:/home/emerald/.local/bin:/opt/:/home/emerald/Applications/:/opt/nvim-linux-x86_64/bin:/usr/local/go/bin

# general
alias dwa="yt-dlp -x --audio-format 'aac' --output \"%(title)s.%(ext)s\"" # download audio
alias python3="/usr/bin/python3.11" # ubuntu problems :(
alias notes="nvim ~/Documents/private-vault" # previously obsidian vault
alias hosts="sudo vim /etc/hosts"
alias bat="batcat"
alias ls="eza"

# pwn college
alias pwn="ssh -i ~/.ssh/pwn_key hacker@pwn.college"

# git
alias gc="git clone"
alias gw="git worktree"
alias lg="lazygit"

# neovim
export EDITOR="nvim"
alias vim="nvim"
alias v="nvim ."
alias conf="nvim ~/.config/nvim"

# open nvim with title set correctly to directory name
nvim_with_title() {
  local dir="$(basename "$PWD")"
  print -Pn "\e]0;$dir\a"
  command nvim "$@"
}
# tmuxp
alias ss="WORKTREE=$(pwd) tmuxp load project"

# python
alias vv="source .venv/bin/activate"

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# agents
alias kc="kiro-cli"
export PATH=~/.opencode/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# needed by OBS for screen record in wayland
export QT_QPA_PLATFORM=wayland
# disable auto title on shell
export DISABLE_AUTO_TITLE='true'

# export go binaries to path
export PATH="$PATH:$(go env GOPATH)/bin"

# todo sh path
export TODO_DIR="~/todo"
