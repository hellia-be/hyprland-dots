#!/usr/bin/env bash

# Hyprland dotfiles setup script for Arch Linux
# This script performs the core setup, installs packages, detects GPU, and links configs
# for a multi-device Arch + Hyprland environment (Nvidia and AMD)

set -e # Exit immediately if a command exits with a non-zero status

## Variables
dotfiles_dir=$(pwd)
config_dir="$HOME/.config"
bin_dir="$HOME/.local/bin"

## Functions
# Package Removal
safe_remove() {
  local pkg_name="$1"
  if pacman -Q "$pkg_name" &>/dev/null; then
    sudo pacman -Rns "$pkg_name" --noconfirm || true
  fi
}

# Step 1: Removing unneeded packages
echo "=> Removing unneeded packages..."
packages=(
  "dolphin"
  "dunst"
  "htop"
  "nano"
  "uwsm"
  "wireless_tools"
  "wofi"
)

for package in "${packages[@]}"; do
  safe_remove "$package"
done

# Step 2: Installing yay-bin
echo "=> Installing yay..."
mkdir -p $HOME/Documents/git
sudo pacman -S --noconfirm git
cd $HOME/Documents/git/
git clone https://aur.archlinux.org/yay-bin
cd yay-bin && makepkg --noconfirm -si

# Step 3: Installing required packages
echo "=> Installing packages..."
packages=(
  "7zip"
  "adwaita-qt5"
  "adwaita-qt6"
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
  "gnome-themes-extra"
  "grim"
  "gvfs"
  "gvfs-smb"
  "gzip"
  "hyprpolkitagent"
  "jq"
  "jre-openjdk"
  "ly"
  "man-db"
  "mpv"
  "neovim"
  "nordvpn-bin"
  "nordvpn-gui"
  "noto-fonts-cjk"
  "noto-fonts-emoji"
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
  "satty"
  "swaybg"
  "swaylock"
  "swaync"
  "tela-circle-icon-theme-grey"
  "thefuck"
  "tree"
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
  yay -S --noconfirm "$package"
  if [[ $? -ne 0 ]]; then
    exit 1
  fi
done

# Step 4: Installing lazyvim
echo "=> Installing lazyvim..."
rm -rf "$config_dir/nvim"
rm -rf "$HOME/.local/share/nvim"
rm -rf "$HOME/.local/state/nvim"
rm -rf "$HOME/.cache/nvim"
git clone https://github.com/LazyVim/starter "$config_dir/nvim"
rm -rf "$config_dir/nvim/.git"

# Step 5: Creating required directories
echo "=> Creating directories..."
mkdir -p "$config_dir/fuzzel"
mkdir -p "$config_dir/hypr"
mkdir -p "$config_dir/kitty"
mkdir -p "$config_dir/nvim/colors"
mkdir -p "$config_dir/satty"
mkdir -p "$config_dir/waybar"
mkdir -p "$config_dir/yazi"
mkdir -p "$config_dir/ohmyposh"
mkdir -p "$config_dir/fontconfig"
mkdir -p "$bin_dir"
mkdir -p "$HOME/Documents/git/fzf"
mkdir -p "$HOME/Pictures/Screenshots"

# Step 6: Putting files in the right places
echo "=> Placing files..."
ln -sf "$dotfiles_dir/.bashrc" "$HOME/.bashrc"
ln -sf "$dotfiles_dir/.config/fuzzel/fuzzel.ini" "$config_dir/fuzzel/fuzzel.ini"
ln -sf "$dotfiles_dir/.config/hypr/hyprland.conf" "$config_dir/hypr/hyprland.conf"
ln -sf "$dotfiles_dir/.config/kitty/kitty.conf" "$config_dir/kitty/kitty.conf"
ln -sf "$dotfiles_dir/.config/nvim/init.lua" "$config_dir/nvim/init.lua"
ln -sf "$dotfiles_dir/.config/nvim/colors/minimal.lua" "$config_dir/nvim/colors/minimal.lua"
ln -sf "$dotfiles_dir/.config/satty/config.toml" "$config_dir/satty/config.toml"
ln -sf "$dotfiles_dir/.config/waybar/config.jsonc" "$config_dir/waybar/config.jsonc"
ln -sf "$dotfiles_dir/.config/waybar/style.css" "$config_dir/waybar/style.css"
ln -sf "$dotfiles_dir/.config/yazi/keymap.toml" "$config_dir/yazi/keymap.toml"
ln -sf "$dotfiles_dir/.config/yazi/yazi.toml" "$config_dir/yazi/yazi.toml"
ln -sf "$dotfiles_dir/.config/fontconfig/fonts.conf" "$config_dir/fontconfig/fonts.conf"
ln -sf "$dotfiles_dir/.local/bin/powermenu.sh" "$bin_dir/powermenu.sh"
chmod +x "$bin_dir/powermenu.sh"
cp "$dotfiles_dir/.local/bin/create-protected-zip.sh" "$bin_dir/create-protected-zip.sh"
chmod +x "$bin_dir/create-protected-zip.sh"
cp "$dotfiles_dir/.local/bin/mount-smb-share.sh" "$bin_dir/mount-smb-share.sh"
chmod +x "$bin_dir/mount-smb-share.sh"
ln -sf "$dotfiles_dir/.config/ohmyposh/EDM115-newline.omp.json" "$config_dir/ohmyposh/EDM115-newline.omp.json"
ln -sf "$dotfiles_dir/fzf/fzf-git.sh" "$HOME/Documents/git/fzf/fzf-git.sh"
chmod +x "$HOME/Documents/git/fzf/fzf-git.sh"

# Step 7: Enabling services
echo "=> Enabling services..."
user_services=(
  "hyprpolkitagent"
)

for service in "${user_services[@]}"; do
  systemctl --user enable --now "$service"
  if [[ $? -ne 0 ]]; then
    exit 1
  fi
done

# Step 7: Nvidia check
echo "=> Checking for nvidia..."
if lspci -k | grep -iE 'nvidia' &> /dev/null; then
  sudo pacman -S --noconfirm nvidia-open-dkms
  cat <<EOF > "$config_dir/hypr/nvidia.conf"
  env = LIBVA_DRIVER_NAME,nvidia
  env = __GLX_VENDOR_LIBRARY_NAME,nvidia
  cursor:no_hardware_cursors = true
  env = GBM_BACKEND,nvidia-drm
  EOF
else
  touch "$config_dir/hypr/nvidia.conf"
fi
