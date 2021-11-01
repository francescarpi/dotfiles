# My personal dotfiles

## Installing

You will need `git`, GNU `stow` and `brew`.

Clone into your `$HOME` directory or wherever you want.

Run the `install.sh` script to install all requirements and symlinks or use `stow` to only create symlinks.

```
./install.sh
```

Generate all symlinks (the '/' ignores the README):

```
stow */
```

Or just select what you want:

```
stow zsh
```

