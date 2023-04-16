# bspwm dotfiles

![image](https://user-images.githubusercontent.com/77888898/232312657-032a96d5-fec9-43b8-99f0-72986dc2e514.png)

## What's in?
- bspwm - Window Manager
- sxhkd - Shortcut Manager
- alacritty - Terminal Emulator
- zsh - Shell
- rofi - Application Launcher
- eww - Status Bar / Dashboard / Notification
- dunst - Notification Daemon (bridge for eww widget)
----
- JetBrains Mono NerdFont - Terminal Font

## Installation

- Install everything described above
```sh
paru -S bspwm sxhkd alacritty zsh rofi dunst pueue eww nerd-fonts-jetbrains-mono
```
- Copy contents of `.config` directory to `~/.config`
- Copy contents of `.scripts` directory to `~/.scripts`
- Copy `.zshrc` to home folder
- Start the `pueued` user service. `systemctl --user start pueued.service`
