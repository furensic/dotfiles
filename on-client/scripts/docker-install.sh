#! /bin/bash

case "${1}" in
    (--apt)
        echo "docker installation not implemented for debian"
    ;;
    (--rpm)
        echo "removing old docker versions if applicable"
        sudo dnf remove docker \
                          docker-client \
                          docker-client-latest \
                          docker-common \
                          docker-latest \
                          docker-latest-logrotate \
                          docker-logrotate \
                          docker-selinux \
                          docker-engine-selinux \
                          docker-engine

        echo "adding docker repository"
        sudo dnf -y install dnf-plugins-core
        sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

        echo "installing docker via dnf"
        sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

        echo "enabling docker daemon"
        sudo systemctl enable --now docker

        echo "running docker hello-world"
        sudo docker run hello-world
    ;;
    (''|*)
        echo "docker installation not implemented for " $1
    ;;
esac