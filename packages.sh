#!/bin/sh

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

packages=(atuin zsh zoxide tmux wget curl openssh duf du-dust fzf neovim vim go)

sudo dnf install -y ${packages[@]}

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source .bashrc # cargo isnt immediately recognized in the PATH
cargo install eza
