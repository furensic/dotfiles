# run this on the client

## Fedora

`sudo dnf install python3-libdnf5`

## things need to fix

- for dust installation i could check wether /bin/dust is already present and skip the steps of installing dust via ansible.builtin.command 
as this will be run every time regardless if its already present (done)
- The issue is that become:yes in main now applies to the cloning and configuration of zshrc config file. It installs and configures it for the root user, 
not sure how i can fix this
