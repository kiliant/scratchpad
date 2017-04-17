[![Build Status](https://travis-ci.org/kiliant/scratchpad.svg?branch=master)](https://travis-ci.org/kiliant/scratchpad)

# scratchpad
*scratchpad* is a lightweight and easily extendible workspace container for local use.

## How to start off?

1. Clone repository
2. Execute `./scratchpad/setup`

## How to use?
Docker will mount *$HOME/.ssh/authorized_keys* inside *scratchpad* (read-only) to both *root* and user *me*. You can __connect via ssh__ to these accounts using suitable keys. It is advised to use the *me* user preferredly over the *root* user.

For __data exchange__, *$HOME/scratchpad* will be created (if not already existing) and be mapped to */home/me* inside the container.

If you pull a new image from docker hub, you will likely get a host key verification warning. Use `ssh-keygen -R localhost` to remove the previously saved host key. This will avoid warnings about changed host keys on each new container.

## Contribute!
*scratchpad* shall stay simple and basic foundation for your local development environment.
If you have packages, that you need and are useful for other users, you can open an [issue](https://github.com/kiliant/scratchpad/issues) or [pull request](https://github.com/kiliant/scratchpad/pulls).

