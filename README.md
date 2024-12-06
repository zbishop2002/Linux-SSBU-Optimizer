# SSBU Suyu/Yuzu Online Play Optimizer for Linux 

<div align="center">
  <img src="media/suyu-banner.png" alt="Suyu Banner" style="width: 75%;">
</div>

## Yuzu/Suyu SSBU Optimizer for Linux
This repository provides a Linux port of [yuzu-ssbu-optimizer](https://github.com/saad-script/yuzu-ssbu-optimizer) by [saad-script](https://github.com/saad-script) to optimize Yuzu for **Super Smash Bros. Ultimate (SSBU)** online play. It includes some extras like Suyu support, automatic backup of your existing **sdmc**, and an alternative pre-modded portable Suyu instance to avoid touching existing configs.

The `ssbu-optimizer.sh` script automatically:
- Renames the existing **sdmc** folder (mods folder) of your selected emulator to `sdmc-backup`, preserving your current configuration.
- Installs a fresh **sdmc** folder preloaded with SSBU mods.

## Alternative: Isolated Suyu Instance
For users who prefer not to modify their current Suyu/Yuzu mod configurations, the included `suyu-ssbu-optimized.sh` script offers a fully portable Suyu AppImage setup. It creates an isolated environment for SSBU using `/Linux-SSBU-Optimizer/home/` as its home folder. Some things to note about using this alternative are:

- It keeps your existing mod setups untouched.
- Will work with the repository's base directory placed anywhere, as long as the internal file structure remains intact.

## Install Alongside Existing Mods
If you have other mods installed and want to try to install the SSBU mods alongside them, you can try manually merging the contents of **sdmc.zip** with your preferred emulator's current sdmc. These are the corresponding paths: 
- Yuzu
  - AppImage: `~/.local/share/yuzu/sdmc`
  - Flatpak: `/.var/app/org.yuzu_emu.yuzu/data/sdmc`
- Suyu AppImage: `~/.local/share/suyu/sdmc`
