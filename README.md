# SSBU Suyu/Yuzu Online Play Optimizer for Linux 

<div align="center">
  <img src="https://raw.githubusercontent.com/zbishop2002/Linux-SSBU-Optimizer/refs/heads/main/media/Banner-Shortest.png" alt="Project Banner">
</div>

## Yuzu/Suyu SSBU Optimizer for Linux
This repository provides a Linux port of [yuzu-ssbu-optimizer](https://github.com/saad-script/yuzu-ssbu-optimizer) by [saad-script](https://github.com/saad-script) to optimize Yuzu for **Super Smash Bros. Ultimate (SSBU)** online play. It includes all main features of the original, as well as some extras like Suyu support, automatic backup of your existing **sdmc**/saves, and a pre-modded portable Suyu instance as an alternative to avoid touching your existing configs.
### Features of SSBU-Optimizer:

- **Automatic Pre-Install Backup of Existing Configurations**:
	- Renames the current **sdmc** folder (mods folder) of your selected emulator to `sdmc-backup`.
    - Creates a backup of `/yuzu/nand/user/save/` in `/yuzu/save_backup/`.
- **Optimized Emulator Configuration**:
	- Replaces the **sdmc** folder with one containing various SSBU 13.0.3 mods for enhanced online play.
    - Loads tailored emulation settings which impact SSBU exclusively
    - Automatically imports a fully completed SSBU save file (see [here](#troubleshooting--issues) for save file issues on multi-user instances)

You can choose to install any combination of the above three to your desired emulator.

**Prerequisites**
- Installed yuzu or suyu
- Added SSBU game directory to yuzu/suyu
- Added keys to yuzu/suyu
## Quickstart: Clone & Start the Optimizer in a Few Clicks

**These commands are queued up for sequential execution, paste the entire box in terminal to install and start the optimizer.** 
```
git clone https://github.com/zbishop2002/Linux-SSBU-Optimizer.git && \
cd Linux-SSBU-Optimizer && \ 
chmod +x SSBU-Optimizer.AppImage && \
./SSBU-Optimizer.AppImage
```

<div align="center">
  <img src="https://raw.githubusercontent.com/zbishop2002/Linux-SSBU-Optimizer/refs/heads/main/media/Preview.png" alt="Interface Preview">
</div>

## Isolated Suyu Instance - Carefree Alternative for Separate Configs
For users who prefer not to modify their current Suyu/Yuzu mod configurations, the included `suyu-ssbu-optimized.sh` script offers a fully portable Suyu AppImage setup. It creates an isolated environment for SSBU using `/Linux-SSBU-Optimizer/home/` as its home folder. Some things to note about using this alternative are:

- It keeps your existing mod setups untouched.
- Will work with the repository's base directory placed anywhere, as long as the internal file structure remains intact.
- Doesn't include the 100% save like the AppImage

## Troubleshooting & Issues

### Multi-User Yuzu Installations & Save File Import
Yuzu stores each user's save files in a path where a unique string in `yuzu/nand/user/save/0000000000000000/UNIQUE-STRING/01006A800016E000/save_data` corresponds to the user's name. In a single-user setup, the `save_data` folder is easily identified within the `yuzu/nand/user/save/0000000000000000/` directory. However, in multi-user setups, the installer may mistakenly place the file in the wrong user directory. Be sure to monitor the AppImage's status updates, as they will indicate the exact file locations.
### Xterm 
The AppImage uses the xterm terminal and thus includes its libraries/executable. However, check if xterm is installed just in case if you are having issues launching the AppImage.

| **Ubuntu/Debian**            | **Fedora/RHEL**              | **Arch**                   |
| ---------------------------- | ---------------------------- | -------------------------- |
| ```sudo apt install xterm``` | ```sudo dnf install xterm``` | ```sudo pacman -S xterm``` |
## Manual Install Instructions (Save File Requires AppImage)

### Settings
Place **/Linux-SSBU-Optimizer/emulator-files/01006A800016E000.ini** in its corresponding path to import only the game specific settings for SSBU:
- Yuzu
  - AppImage: `~/.config/yuzu/custom`
  - Flatpak: `~/.var/app/org.yuzu_emu.yuzu/config/yuzu/custom`
- Suyu AppImage: `~/.config/suyu/custom`

### Mods
If you have other mods installed and want to try to install the SSBU mods alongside them, you can try manually merging the contents of **/Linux-SSBU-Optimizer/emulator-files/sdmc/** with your preferred emulator's current sdmc. These are the corresponding paths: 
- Yuzu
  - AppImage: `~/.local/share/yuzu/sdmc`
  - Flatpak: `~/.var/app/org.yuzu_emu.yuzu/data/yuzu/sdmc`
- Suyu AppImage: `~/.local/share/suyu/sdmc`
