#!/bin/bash

# Extract sdmc.zip
if unzip -o sdmc.zip > /dev/null 2>&1; then
  echo "sdmc.zip successfully extracted."
else
  echo "Failed to unzip sdmc.zip."
  exit 1
fi

# Prompt user to select an option
echo "Your emulator's sdmc folder will be renamed to sdmc-backup, and a fresh sdmc (modded for SSBU only) will replace it. Select the installed emulator on which you want the mods:"
echo "1) Yuzu AppImage"
echo "2) Yuzu Flatpak"
echo "3) Suyu AppImage"
read -p "Enter your choice (1/2/3): " choice

# Determine paths based on user selection
case $choice in
  1)
    target_dir="$HOME/.local/share/yuzu"
    ;;
  2)
    target_dir="$HOME/.var/app/org.yuzu_emu.yuzu/data/yuzu"
    ;;
  3)
    target_dir="$HOME/.local/share/suyu"
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
cp -r sdmc "$target_dir/" || { echo "Failed install mods by copying sdmc to $target_dir"; exit 1; }

echo "Mods successfully installed, old sdmc backed up in $target_dir"
