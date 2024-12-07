# dotfiles

These dotfiles use dotbot to manage, but you don't need to installed it since we include it as a git sub module.

This dotfiles include three part

1.  Dotfile on Linux Mint 22 Cinnamon Edition
2.  Dotfile on macOS
3.  Dotfile on BOTH.

The script should determine os automatically, just run
```bash
./install
```
and it will link the dotfile to its place.

## IMPORTANT NOTE:
The dotfile mean to run on Linux Mint 22 Cinnamon Edtion, but if you want to run on other distro, you need to edit bspwm file and remove this line.

```bashrc
...
pgreq -x cinnamon-session > /dev/null || cinnamon-session &
...
```
