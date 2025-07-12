# run this on the client

## Fedora

`sudo dnf install python3-libdnf5`

## things need to fix

- for dust installation i could check wether /bin/dust is already present and skip the steps of installing dust via ansible.builtin.command 
as this will be run every time regardless if its already present (done)
- The issue is that become:yes in main now applies to the cloning and configuration of zshrc config file. It installs and configures it for the root user, 
not sure how i can fix this (done)

- Use different tags for different environments e.g. install nmap for standard clients but not servers, or install GUI tools for desktop clients but not CLI Servers.

- create a /tmp/tldr-timestamp file to check the last time tldr cache has been cached, and only cache if timestamp older than x amount of time.
