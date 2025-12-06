# prompt styling
PROMPT="%F{red}[%f%B%n%b%F{red}]%f%F{white}@%f%F{red}[%f%B%m%b%F{red}]%f%F{white}:%f%F{red}[%f%B%~%b%F{red}]%f%F{red}> %f"
RPROMPT="%F{red}[%f%B%?%b%F{red}]%f - %F{red}[%f%B%w%b - %B%T%b%F{red}]%f - %F{red}[%f%B%h%b%F{red}]%f"

# Aliases
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


# PATH
export PATH="/home/leo/.local/bin/lua-language-server/bin:./.local/bin/lua-language-server/bin/lua-language-server:~/.local/bin/lua-language-server/bin:~/.local/bin:$PATH"

# source zsh plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# hook zoxide
eval "$(zoxide init zsh)"

# hook atuin
eval "$(atuin init zsh)"
