#! /bin/bash

### create directories ###
mkdir -p ~/downloads
mkdir -p ~/tmp
mkdir -p ~/.zsh

### install packages ###
echo "installing packages for rpm"

echo "updating dnf cache"
sudo dnf update -y &> /dev/null

cat ./packages | while read line
do
    echo "installing package $line"
    sudo dnf install $line -y &> /dev/null
done

### install docker ###
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

### adding user to docker group ###
echo "creating docker group"
sudo groupadd docker

echo "adding current user $USER to docker group"
sudo usermod -aG docker $USER

### install dust ###
wget -O ~/downloads/dust.tar.gz https://github.com/bootandy/dust/releases/download/v1.2.1/dust-v1.2.1-x86_64-unknown-linux-gnu.tar.gz

cd ~/downloads

tar -xvf dust.tar.gz
mv dust-* dust

sudo mv ./dust/dust /bin/

echo "running dust on home directory"
dust ~/

rm -r ~/downloads/dust*

### pulling zsh plugins ###
echo "pulling zsh autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

echo "pulling zsh syntax highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

### installing gping ###
sudo dnf copr enable atim/gping -y
sudo dnf install gping -y

### generating ssh key pair ###
# check if .ssh folder exists and check if key is present
if [ -f ~/.ssh/id_*.pub ]; then
    echo "public key file is already present. skipping key generation"
else
    echo "generating ssh key pair"
    ssh-keygen -t ed25519 -C "$HOSTNAME"
fi

### copy .zshrc file to user home ###
cp .zshrc ~/.zshrc
cp .zshprofile ~/.zshprofile
