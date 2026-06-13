# ==================================================================
# Options 
# ==================================================================
# 
autoload -Uz compinit
compinit

# edit-command-line hook
autoload edit-command-line; zle -N edit-command-line

# Better tab-completion menu
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Z/a-z}' # Case-insensitive completion

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt APPEND_HISTORY          # Don't overwrite the history file; append to it
setopt SHARE_HISTORY           # Share history between different instances of zsh
setopt HIST_IGNORE_DUPS        # Don't store a duplicate of the last command
setopt HIST_IGNORE_ALL_DUPS    # Delete old recorded duplicates on new ones
setopt HIST_REDUCE_BLANKS      # Remove superfluous blanks from each command line
setopt HIST_IGNORE_SPACE       # Don't record commands starting with a space

# ==================================================================
# Prompt 
# ==================================================================
# 
PROMPT="%F{red}[%f%B%n%b%F{red}]%f%F{white}@%f%F{red}[%f%B%m%b%F{red}]%f%F{white}:%f%F{red}[%f%B%~%b%F{red}]%f
%F{red}> %f"
RPROMPT="%F{red}[%f%B%?%b%F{red}]%f - %F{red}[%f%B%w%b - %B%T%b%F{red}]%f - %F{red}[%f%B%h%b%F{red}]%f"

# ==================================================================
# Keybindings 
# ==================================================================
# 
bindkey '^[[1;5C' forward-word       # Ctrl + Right Arrow
bindkey '^[[1;5D' backward-word      # Ctrl + Left Arrow
bindkey '^[[3;5~' kill-word          # Ctrl + Delete
bindkey '^H' backward-kill-word      # Ctrl + Backspace
bindkey '^[[3~' delete-char          # Standard Delete key
bindkey '^[[1; ' magic-space				 # Ctrl + Space
bindkey -M vicmd ve edit-command-line

export EDITOR="nvim"
export VISUAL="nvim"

# ==================================================================
# Aliases 
# ==================================================================
# 
alias cd="z"
alias l="eza -Ah --git --long --header --group-directories-first --icons=auto" # All (without .., .) human-readable, group directories first, display git information, long table, show headers
alias ls="l"
alias lst="l --tree -L 3"

alias cat="bat"
alias catp="bat -p" # for plain view & copying from terminal

alias zshrc="$EDITOR ~/.zshrc; source ~/.zshrc; echo reloaded zshrc"

# VIM Aliases
alias vim="nvim"
alias vi="nvim"
alias v="nvim"

alias df="duf"
alias du="dust"

alias ff="fzf | grep -o \$EDITOR"

# Git Aliases
alias gs="git status"
alias gaa="git add ."
alias gc="git commit"
alias gcm="git commit -m"
alias gcmnosign="git -c commit.gpgsign=false commit"
alias gpo="git push origin main"

# Docker Compose Aliases
alias dcu="docker compose up"
alias dcud="docker compose up -d"
alias dclf="docker compose logs -f"
alias dcps="docker compose ps"
alias dcufr="docker compose down && docker compose up -d --force-recreate"

# Docker Aliases
alias docps="docker ps"
alias docvl="docker volumes ls"
alias docil="docker image ls"

# Misc Aliases
alias vencord-up='sh -c "$(curl -sS https://vencord.dev/install.sh)"'
alias romvault='GTK_DATA_PREFIX= mono /mnt/myrient_data/emu/tool/ROMVault/ROMVault37.exe'
#alias ymir='ymir-emu'

# ==================================================================
# PATH configuration
# ==================================================================
# 
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:/home/leo/.local/bin/lua-language-server/bin:./.local/bin/lua-language-server/bin/lua-language-server:~/.local/bin/lua-language-server/bin:~/.local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# ==================================================================
# zsh plugins
# ==================================================================
#
# source zsh plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-alias-finder/zsh-alias-finder.plugin.zsh
source ~/.zsh/zsh-fzf-tab/fzf-tab.plugin.zsh


# ==================================================================
# zoxide configuration
# ==================================================================
#
eval "$(zoxide init zsh)"

# hook atuin
#eval "$(atuin init zsh)"

# ==================================================================
# Glasgow Haskell Compiler configuration
# ==================================================================
#
[ -f "/home/leo/.ghcup/env" ] && . "/home/leo/.ghcup/env" # ghcup-env

# ==================================================================
# OCaml Package manager configuration
# ==================================================================
# 
# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/home/leo/.opam/opam-init/init.zsh' ]] || source '/home/leo/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration
