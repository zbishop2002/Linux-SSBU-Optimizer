#!/bin/bash

# Define paths
SOURCE_INI_FILE="/emulator-files/01006A800016E000.ini"
SOURCE_SDMC="/emulator-files/sdmc"

# Prompt user to select an option
echo "Select the emulator where you want to install mods (the sdmc folder of your selected emulator, containing all its current mods, will remain in the same directory but renamed to sdmc-backup. The repo's sdmc folder will replace it.):"
echo "1) Yuzu AppImage"
echo "2) Yuzu Flatpak"
echo "3) Suyu AppImage"
read -p "Enter your choice (1/2/3): " choice

# Determine paths based on user selection
case $choice in
  1)
    target_dir="$HOME/.local/share/yuzu"
    custom_dir="$HOME/.config/yuzu/custom"
    ;;
  2)
    target_dir="$HOME/.var/app/org.yuzu_emu.yuzu/data/yuzu"
    custom_dir="$HOME/.var/app/org.yuzu_emu.yuzu/config/yuzu/custom"
    ;;
  3)
    target_dir="$HOME/.local/share/suyu"
    custom_dir="$HOME/.config/suzu/custom"
    ;;
  *)
    echo "Invalid choice. Exiting."
    exit 1
    ;;
esac

# Backup existing sdmc and copy new sdmc
if [ -d "$target_dir/sdmc" ]; then
  mv "$target_dir/sdmc" "$target_dir/sdmc-backup" || { echo "Failed to rename existing sdmc to sdmc-backup"; exit 1; }
fi
cp -r "$SOURCE_SDMC" "$target_dir/" || { echo "Failed to copy $SOURCE_SDMC to $target_dir"; exit 1; }

# Ensure custom directory exists and copy .ini file
mkdir -p "$custom_dir" || { echo "Failed to create custom directory at $custom_dir"; exit 1; }
cp "$SOURCE_INI_FILE" "$custom_dir" || { echo "Failed to copy $SOURCE_INI_FILE to $custom_dir"; exit 1; }

echo "Mods folder (sdmc) and custom settings successfully installed for the selected emulator."

