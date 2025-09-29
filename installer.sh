#!/bin/bash

packages=(
  "dolphin"
  "dunst"
  "htop"
  "nano"
  "uwsm"
  "wofi"
)

for package in "${packages[@]}"; do
  sudo pacman -Rns "$package"
  if [[ $? -ne 0 ]]; then
    exit 1
  fi
done

mkdir -p $HOME/Documents/git
sudo pacman -S git
cd $HOME/Documents/git/
git clone https://aur.archlinux.org/yay-bin
cd yay-bin && makepkg -si

packages=(
  "7zip"
  "bat"
  "blueman"
  "bolt-launcher"
  "brightnessctl"
  "cronie"
  "darktable"
  "duf"
  "discord"
  "downgrade"
  "eza"
  "fastfetch"
  "fd"
  "firefox"
  "fuzzel"
  "fzf"
  "gimp"
  "glances"
  "grim"
  "gvfs"
  "gvfs-smb"
  "gzip"
  "jq"
  "jre-openjdk"
  "kdeconnect"
  "ly"
  "man-db"
  "megasync-bin"
  "mpv"
  "neovim"
  "nordvpn-bin"
  "nordvpn-gui"
  "nwg-displays"
  "nwg-look"
  "obsidian-bin"
  "oh-my-posh-bin"
  "ouch"
  "pavucontrol-qt"
  "qbittorrent"
  "qt5ct"
  "qt6ct"
  "reflector-simple"
  "slurp"
  "smbclient"
  "spotify-launcher"
  "steam"
  "swappy"
  "swaybg"
  "swaylock"
  "swaync"
  "tela-circle-icon-theme-grey"
  "thefuck"
  "tree"
  "ttf-cascadia-mono-nerd"
  "ttf-jetbrains-mono-nerd"
  "udiskie"
  "unzip"
  "waybar"
  "xz"
  "yazi"
  "z"
  "zip"
  "zoxide"
)

for package in "${packages[@]}"; do
  yay -S "$package"
  if [[ $? -ne 0 ]]; then
    exit 1
  fi
done
