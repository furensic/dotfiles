autoload -Uz compinit
compinit
# Better tab-completion menu
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Z/a-z}' # Case-insensitive completion

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt APPEND_HISTORY          # Don't overwrite the history file; append to it
setopt SHARE_HISTORY           # Share history between different instances of zsh
setopt HIST_IGNORE_DUPS        # Don't store a duplicate of the last command
setopt HIST_IGNORE_ALL_DUPS    # Delete old recorded duplicates on new ones
setopt HIST_REDUCE_BLANKS      # Remove superfluous blanks from each command line
setopt HIST_IGNORE_SPACE       # Don't record commands starting with a space

# prompt styling
PROMPT="%F{red}[%f%B%n%b%F{red}]%f%F{white}@%f%F{red}[%f%B%m%b%F{red}]%f%F{white}:%f%F{red}[%f%B%~%b%F{red}]%f
%F{red}> %f"

RPROMPT="%F{red}[%f%B%?%b%F{red}]%f - %F{red}[%f%B%w%b - %B%T%b%F{red}]%f - %F{red}[%f%B%h%b%F{red}]%f"
# Keybindings for Ctrl + Arrows (Word jumping)
bindkey '^[[1;5C' forward-word       # Ctrl + Right Arrow
bindkey '^[[1;5D' backward-word      # Ctrl + Left Arrow

# Optional: Also fix Ctrl + Delete/Backspace if they give you trouble
bindkey '^[[3;5~' kill-word          # Ctrl + Delete
bindkey '^H' backward-kill-word      # Ctrl + Backspace
bindkey '^[[3~' delete-char          # Standard Delete key

export EDITOR="nvim"

# Aliases
alias cd="z"
alias l="eza -Ah --git --long --header --group-directories-first --icons=auto" # All (without .., .) human-readable, group directories first, display git information, long table, show headers
alias ls="l"
alias lst="l --tree -L 3"
alias vim="nvim"
alias vi="nvim"
alias df="duf"
alias du="dust"
alias ff="fzf | grep -o \$EDITOR"

alias gs="git status"
alias gaa="git add ."
alias gcm="git commit"
alias gpo="git push origin main"

alias dcu="docker compose up"
alias dcud="docker compose up -d"
alias dclf="docker compose logs -f"
alias dcps="docker compose ps"

alias docps="docker ps"
alias docvl="docker volumes ls"
alias docil="docker image ls"

alias vencord-up='sh -c "$(curl -sS https://vencord.dev/install.sh)"'
alias romvault='GTK_DATA_PREFIX= mono /mnt/myrient_data/emu/tool/ROMVault/ROMVault37.exe'
#alias ymir='ymir-emu'
# PATH
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:/home/leo/.local/bin/lua-language-server/bin:./.local/bin/lua-language-server/bin/lua-language-server:~/.local/bin/lua-language-server/bin:~/.local/bin:$PATH"

# source zsh plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# hook zoxide
eval "$(zoxide init zsh)"

# hook atuin
#eval "$(atuin init zsh)"

#eval "$(~/coding/retro-collect/cli/build/sillydb-cli --config ~/coding/retro-collect/cli/build/config.yaml completion zsh)"

[ -f "/home/leo/.ghcup/env" ] && . "/home/leo/.ghcup/env" # ghcup-env
