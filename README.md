# Custom Arch Linux with Hyprland configuration

Custom configuration for Arch Linux using Hyprland.

Do note that this is based on the way I install my Arch Linux and may not work for you.

## Features

### Adwaita Theme
- **Dark aesthetic** with monochromatic accents
- **No wallpapers** included to save on resources
- **Coordinated color scheme** across all components

### Enhanced Components
- **Hyprland**: Custom keybinds and window management
- **Waybar**: Personalized layout and modules
- **Scripts**: Additional utilities including fzf-git integration

## Prerequisites

- **Arch Linux**
- **Hyprland** with **ly** and all **systemd** utilities installed - recommended
- **Internet connection** for downloading packages
- **Git** installed

## Installation

### Automated
```bash
mkdir -p $HOME/Documents/git && cd $HOME/Documents/git && git clone https://github.com/hellia-be/hyprland-dots && cd hyprland-dots && chmod +x installer.sh && ./installer.sh
```

### Activate Theme
1. Reboot the computer
2. Open nwg-look
3. Select Adwaita-dark
4. Change the font to JetBrainsMono Nerd Font Regular
5. Set the icon theme to Tela circle grey dark
6. Apply and close
7. Open qt5ct
8. Select Adwaita-Dark
9. Set the color scheme to darker
10. Change the general font to JetBrainsMono Nerd Font
11. Change the fixed width font to JetBrainsMono Nerd Font Mono
12. Change the icon theme to Tela circle grey dark
13. Apply the changes and do the same in qt6ct
