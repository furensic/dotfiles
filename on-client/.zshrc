# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/leo/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
PROMPT="%F{red}[%f%B%n%b%F{red}]%f%F{white}@%f%F{red}[%f%B%m%b%F{red}]%f%F{white}:%f%F{red}[%f%B%~%b%F{red}]%f%F{red}> %f"

RPROMPT="%F{red}[%f%B%?%b%F{red}]%f - %F{red}[%f%B%w%b - %B%T%b%F{red}]%f - %F{red}[%f%B%h%b%F{red}]%f"

# Aliases
alias l="lsd -lAh --group-directories-first --header"
alias df="duf"
alias du="dust"
alias ff="fzf | xargs -o \$EDITOR"
alias ping="gping"


source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH=~/bin:$PATH
export PATH=/home/leo/go/bin:$PATH

eval "$(direnv hook zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
