[![Build Status](https://travis-ci.org/kiliant/scratchpad.svg?branch=master)](https://travis-ci.org/kiliant/scratchpad)

# scratchpad
*scratchpad* is a lightweight and easily extendible workspace container for local use.

## How to start off?

1. Clone repository
2. Execute ```docker-compose up -d scratchpad```

## How to use?
Docker will mount *$HOME/.ssh/authorized_keys* inside *scratchpad*. You can connect via ssh to *scratchpad*'s root account using suitable keys.

If you trust your host, it may be useful to add
```
  Host localhost
  StrictHostKeyChecking no
 ```
to your `.ssh/config`. This will avoid warnings about changed host keys on each new container.

## Contribute!
*scratchpad* shall stay simple and basic foundation for your local development environment.
If you have packages, that you need and are useful for other users, you can open an [issue](https://github.com/kiliant/scratchpad/issues) or [pull request](https://github.com/kiliant/scratchpad/pulls).
