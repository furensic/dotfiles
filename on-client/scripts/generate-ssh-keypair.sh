#! /bin/bash

# check if .ssh folder exists and check if key is present
if [ -f ~/.ssh/id_*.pub ]; then
    echo "public key file is already present. skipping key generation"
else
    echo "generating ssh key pair"
    ssh-keygen -t ed25519 -C "$HOSTNAME"
fi