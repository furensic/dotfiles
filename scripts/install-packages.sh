#! /bin/bash

case "${1}" in
    (--apt)
        echo "installing packages for debian"

        echo "updating apt cache"
        sudo apt update -y &> /dev/null
        sudo apt upgrade -y &> /dev/null

        cat ~/dotfiles/packages | while read line
        do
            echo "installing package $line"
            sudo apt install $line -y
        done
    ;;
    (--rpm)
        echo "installing packages for rpm"

        echo "updating dnf cache"
        sudo dnf update -y &> /dev/null

        cat ~/dotfiles/packages | while read line
        do
            echo "installing package $line"
            sudo dnf install $line -y
        done
    ;;
    (''|*)
        echo "unrecognised distro, use --deb or --rpm flag" $1
    ;;
esac