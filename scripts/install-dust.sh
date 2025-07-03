#! /bin/bash

wget -O ~/downloads/dust.tar.gz https://github.com/bootandy/dust/releases/download/v1.2.1/dust-v1.2.1-x86_64-unknown-linux-gnu.tar.gz

cd ~/downloads

tar -xvf dust.tar.gz
mv dust-* dust

sudo mv ./dust/dust /bin/

echo "running dust on home directory"
dust ~/

rm -r ~/downloads/dust*