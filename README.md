# My personal dotfiles

These are my `dotfiled`, used on a Mac OS.

## Installation

You need `git` and GNU `stow`.

Clone the code into your `$HOME` directory or wherever you want.

Run `stow` tool to create symlinks.

```
stow -t $HOME */
```

It generates all symlinks to your home (the '/' ignores the README).

Or if you just select what you want:

```
stow zsh
```

