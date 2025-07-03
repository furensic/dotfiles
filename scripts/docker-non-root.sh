#! /bin/bash

echo "creating docker group"
sudo groupadd docker

echo "adding current user $USER to docker group"
sudo usermod -aG docker $USER

#echo "verifying permissions, running hello-world without sudo prefix"
#docker run hello-world