# oh my zsh
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="eastwood"
HYPHEN_INSENSITIVE="true"
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

source $ZSH/oh-my-zsh.sh

# path
export PATH=$PATH:$HOME/.local/bin:/opt/:$HOME/Applications/:/opt/nvim-linux-x86_64/bin:/usr/local/go/bin

# general
alias dwa="yt-dlp -x --audio-format 'aac' --output \"%(title)s.%(ext)s\"" # download audio
alias python3="/usr/bin/python3.11" # ubuntu problems :(
alias hosts="sudo vim /etc/hosts"
alias bat="batcat"
alias ls="eza"

# git
alias gc="git clone"
alias gw="git worktree"
alias gp="git pull"
alias lg="lazygit"

# neovim
export EDITOR="nvim"
alias vim="nvim"
alias v="nvim ."
alias conf="nvim $HOME/.config/nvim"

# open nvim with title set correctly to directory name (for ubuntu terminal)
nvim_with_title() {
  local dir="$(basename "$PWD")"
  print -Pn "\e]0;$dir\a"
  command nvim "$@"
}

# python
alias vv="source .venv/bin/activate"

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# agents
alias kc="kiro-cli"
export PATH=$HOME/.opencode/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# needed by OBS for screen record in wayland
export QT_QPA_PLATFORM=wayland
# disable auto title on shell
export DISABLE_AUTO_TITLE='true'

# export go binaries to path
export PATH="$PATH:$(go env GOPATH)/bin"

# Created by `pipx`
export PATH="$PATH:$HOME/.local/bin"

# todo sh path
export TODO_DIR="$HOME/todo"

# switch claude code profile
ccenv() {
    case "$1" in
        work|personal)
            cp ~/.claude.json.$1 ~/.claude.json && \
						cp ~/.claude/.credentials.json.$1 ~/.claude/.credentials.json.work && \
						echo "Switched to $1 profile"
            ;;
        *)
            echo "Usage: claude-profile [work|personal]"
            ;;
    esac
}

