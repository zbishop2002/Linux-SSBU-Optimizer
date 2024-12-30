#!/bin/bash

# Define paths
SOURCE_INI_FILE="$APPDIR/usr/bin/emulator-files/01006A800016E000.ini"
SOURCE_SDMC="$APPDIR/usr/bin/emulator-files/sdmc"
SOURCE_SAVE_DATA="$APPDIR/usr/bin/emulator-files/save_data"

# Define color codes
GREEN="\e[38;5;46m"    # Green color for success messages
RED="\e[38;5;88m"      # Red color for error messages
RESET="\e[0m"          # Reset color

# Function to display bright red-colored ASCII Art
display_ascii_art() {
    echo -e "\e[1;38;5;196m⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣴⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    echo -e "\e[1;38;5;196m⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣦⣾⢟⢁⡄⠀⠀⠀⠀⠀⠀⠀⢀⡤⠂⠀⠀⠀"
    echo -e "\e[1;38;5;196m⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⢟⣿⣿⣾⠟⠁⠀⣠⣾⠀⠀⠀⢠⣿⠄⠀⠀⠀⠀"
    echo -e "\e[1;38;5;196m⠀⠀⠀⠀⠀⢀⠀⠀⣼⣧⠀⢺⣿⣿⡃⠀⣴⣿⡟⠁⣼⠅⣠⣿⡗⡠⠀⠀⠀⠀"
    echo -e "\e[1;38;5;196m⠀⠀⠀⠀⢰⣧⣠⣾⣿⣿⣆⣼⣿⣿⣡⢀⣿⣿⣿⣾⣿⣾⣿⣷⠟⠁⠀⠀⠀⠀"
    echo -e "\e[1;38;5;196m⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣾⣿⣿⣿⣿⡿⠟⢛⠁⠀⠀⠀⠀⠀⠀"
    echo -e "\e[1;38;5;196m⠀⠀⣀⣠⣾⣿⣿⣿⡏⠉⠉⠙⠛⠿⣿⣿⣿⣿⣿⣋⣀⣤⣏⠀⠀⠀⠀⠀⠀⠀"
    echo -e "\e[1;38;5;196m⠀⣤⣿⣿⠋⣿⣿⣿⡇⠀⠀⠀⠀⠀⠈⢻⣿⣿⣿⣿⠿⠟⠁⠀⠀⠀⠀⠀⠀⠀ \e[1;38;5;27mSMASH ULTIMATE ONLINE PLAY OPTIMIZER\e[0m"
    echo -e "\e[1;38;5;196m⠀⢿⣿⠃⠀⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⢻⣿⡟⠀⠀⠀⠀⣠⠆⠀⠀⠀⠀⠀       \e[1;38;5;27mFOR SUYU & YUZU ON LINUX\e[0m"
    echo -e "\e[1;38;5;196m⢀⣼⡏⠀⠀⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⣿⡉⢀⣀⣤⣾⠇⠀⠀⠀⠀⣀⠄"
    echo -e "\e[1;38;5;196m⢻⣿⣧⣤⣤⣿⣿⣿⣧⣤⣤⣤⣤⣤⣤⣤⣤⣿⣿⣿⡿⠋⠁⠀⠀⠀⣠⣾⡁⠀"
    echo -e "\e[1;38;5;196m⠈⢻⣿⡍⠉⣿⣿⣿⡏⠉⠉⠉⠉⠉⠉⠉⣽⣿⣿⣿⣯⣴⣿⣥⣶⡾⢟⠉⠀⠀"
    echo -e "\e[1;38;5;196m⠀⢨⣿⣿⣦⣿⣿⣿⡇⠀⠀⠀⠀⠀⣀⣾⣿⣿⣿⣿⡿⠿⠿⠿⠾⠛⠁⠀⠀⠀"
    echo -e "\e[1;38;5;196m⠀⠀⠻⠿⢿⣿⣿⣿⣇⣀⣀⣤⣴⣾⣿⣿⣿⣿⣿⣿⠶⠄⠀⠀⠀⠀⠀⠀⠀⠀"
    echo -e "\e[1;38;5;196m⠀⠀⠀⠀⠀⠙⠛⠛⠻⠟⠛⠿⠿⠿⢿⣷⣤⡾⠯⠁⠀"
    
    # Reset to default color
    echo -e "\e[0m"
}

# Display ASCII Art
display_ascii_art

echo -e "\e[38;5;243mNOTE: Your existing sdmc and saves will be automatically backed up.\e[0m"
echo

# Display bold text
echo -e "\e[1mSelect the emulator on which to load the saves/mods/settings:\e[0m"

echo -e "1) \e[1;38;5;45mYuzu\e[0m \e[1;38;5;9mAppImage\e[0m"
echo -e "2) \e[1;38;5;45mYuzu\e[0m \e[1;38;5;9mFlatpak\e[0m"
echo -e "3) \e[1;38;5;204mSuyu\e[0m \e[1;38;5;39mAppImage\e[0m"
echo

read -p "Enter your choice (1/2/3): " choice
echo

# Function to perform emulator-specific setup
setup_emulator() {
    local emulator_choice=$1
    case $emulator_choice in
      1)
        # Yuzu AppImage paths
        target_dir="$HOME/.local/share/yuzu"
        custom_dir="$HOME/.config/yuzu/custom"
        ;;
      2)
        # Yuzu Flatpak paths
        target_dir="$HOME/.var/app/org.yuzu_emu.yuzu/data/yuzu"
        custom_dir="$HOME/.var/app/org.yuzu_emu.yuzu/config/yuzu/custom"
        ;;
      3)
        # Suyu AppImage paths
        target_dir="$HOME/.local/share/suyu"
        custom_dir="$HOME/.config/suyu/custom"
        ;;
      *)
        echo -e "${RED}Invalid emulator choice.${RESET}"
        exit 1
        ;;
    esac
}

# Perform actions based on user selection
if [[ "$choice" =~ ^[1-3]$ ]]; then
    setup_emulator "$choice"
else
    echo -e "${RED}Invalid input. Please run the script again and select a valid option.${RESET}"
    exit 1
fi

# Prompt for additional selections
echo -e "\e[1mSelect what emulator files to import:\e[0m"
echo "1) Smash Ultimate Emulation Settings"
echo "2) Optimization Mods (sdmc)"
echo "3) 100% Save File (save_data)"
echo
echo "Enter your choices separated by spaces (e.g., 1 3):"

read -p "Your selections: " selections
echo

# Convert selections to an array
IFS=' ' read -r -a selected_items <<< "$selections"

# Function to backup and copy sdmc
copy_sdmc() {
    if [ -d "$target_dir/sdmc" ]; then
        mv "$target_dir/sdmc" "$target_dir/sdmc-backup" || { echo -e "${RED}Failed to rename existing sdmc to sdmc-backup.${RESET}"; exit 1; }
        echo -e "${GREEN}Existing sdmc backed up to $target_dir/sdmc-backup.${RESET}"
        echo
    fi
    cp -r "$SOURCE_SDMC" "$target_dir/" || { echo -e "${RED}Failed to copy $SOURCE_SDMC to $target_dir.${RESET}"; exit 1; }
    echo -e "${GREEN}Modded sdmc copied to $target_dir.${RESET}"
    echo
}

# Function to backup and copy save_data
copy_save_data() {
    # Backup existing save_data
    cp -r "$target_dir/nand/user/save/" "$target_dir/" || { echo -e "${RED}Failed to backup existing save_data.${RESET}"; exit 1; }
    mv "$target_dir/save" "$target_dir/save_backup" || { echo -e "${RED}Failed to rename existing save to save_backup.${RESET}"; exit 1; }
    echo -e "${GREEN}Existing save data backed up to $target_dir/save_backup.${RESET}"
    echo

    # Remove existing save_data
    rm -rf "$target_dir/nand/user/save/0000000000000000/"*/"01006A800016E000/save_data" || { echo -e "${RED}Failed to remove existing save_data.${RESET}"; exit 1; }

    # Copy new save_data to the first matching path
    for match in "$target_dir/nand/user/save/0000000000000000/"*/"01006A800016E000/"; do
      if [ -d "$match" ]; then
        cp -r "$SOURCE_SAVE_DATA" "$match" || { echo -e "${RED}Failed to copy save_data to $match.${RESET}"; exit 1; }
        echo -e "${GREEN}100% save_data copied to $match.${RESET}"
        echo
        break  # Stop after handling the first match
      fi
    done
}

# Function to copy .ini file
copy_ini_file() {
    # Ensure custom directory exists and copy .ini file
    mkdir -p "$custom_dir" || { echo -e "${RED}Failed to create custom directory at $custom_dir.${RESET}"; exit 1; }
    cp "$SOURCE_INI_FILE" "$custom_dir" || { echo -e "${RED}Failed to copy $SOURCE_INI_FILE to $custom_dir.${RESET}"; exit 1; }
    echo -e "${GREEN}SSBU emulator settings copied to $custom_dir.${RESET}"
    echo
}

# Iterate through selected items and perform actions
for item in "${selected_items[@]}"; do
    case $item in
        1)
            copy_ini_file
            ;;
        2)
            copy_sdmc
            ;;
        3)
            copy_save_data
            ;;
        *)
            echo -e "${RED}Invalid selection: $item. Skipping.${RESET}"
            ;;
    esac
done

echo
echo -e "\e[1m${GREEN}Selected items have been successfully installed for the chosen ${RESET}"
echo -e "\e[1m${GREEN}emulator. Backups (if any) are located in $target_dir ${RESET}"



