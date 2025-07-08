# run this on the client

## Fedora

`sudo dnf install python3-libdnf5`

## things need to fix

- for dust installation i could check wether /bin/dust is already present and skip the steps of installing dust via ansible.builtin.command 
as this will be run every time regardless if its already present (done)
