#!/bin/sh

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

packages=(zsh zoxide rust tmux wget curl openssh duf du-dust fzf neovim vim go)

sudo dnf install -y ${packages[@]}
