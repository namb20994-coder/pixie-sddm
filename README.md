# ✨ Pixie SDDM

A clean, modern, and minimal SDDM theme inspired by Google Pixel UI and Material Design 3. 

<div align="center">
  <img src="screenshots/lock_screen.png" width="45%" alt="Lock Screen" />
  <img src="screenshots/login_screen.png" width="45%" alt="Login Screen" />
</div>

<div align="center">
  <img src="screenshots/lock_screen_2.png" width="22%" />
  <img src="screenshots/login_screen_2.png" width="22%" />
  <img src="screenshots/lock_screen_3.png" width="22%" />
  <img src="screenshots/login_screen_3.png" width="22%" />
</div>

## 🌟 Features

- **Pixel Aesthetic:** Clean typography and a unique two-tone stacked clock.
- **Material You Dynamic Colors:** Intelligent color extraction that samples your wallpaper for UI accents.
- **Smooth Transitions:** High-performance fade-in animations for all UI elements.
- **Material Design 3:** Dark card UI with smooth interactions and responsive dropdowns.
- **Keyboard Navigation:** Full support for navigating menus with arrows and `Enter`.
- **Blur Effects:** Adaptive background blur that transitions smoothly when the login card is active.

---

## 📦 Prerequisites

Pixie SDDM is now a **Professional Qt6 Theme**, optimized for modern, bleeding-edge distributions (Fedora 40+, Arch Linux, NixOS, etc.). 

To avoid a black screen, ensure you have the required Qt6 modules installed:

<details>
<summary><b>Arch Linux / CachyOS / Manjaro</b> (Click to expand)</summary>

```bash
sudo pacman -S --needed qt6-declarative qt6-svg qt6-quickcontrols2 qt6-effects
```
</details>

<details>
<summary><b>Fedora / RHEL / CentOS</b> (Click to expand)</summary>

```bash
sudo dnf install qt6-qtdeclarative qt6-qtsvg qt6-qtquickcontrols2 qt6-qteffects
```
</details>

<details>
<summary><b>openSUSE</b> (Click to expand)</summary>

```bash
sudo zypper install qt6-declarative qt6-svg qt6-quickcontrols2 qt6-effects
```
</details>

<details>
<summary><b>Ubuntu 24.10+ / Debian Trixie</b> (Click to expand)</summary>

```bash
sudo apt update && sudo apt install qml6-module-qtquick-controls qml6-module-qtquick-layouts qml6-module-qtquick-effects libqt6svg6
```
</details>

---

## 🚀 Installation

### 1. Arch Linux (AUR)
Install the theme using your favorite AUR helper:
```bash
yay -S pixie-sddm-git
```

### 2. Automatic Script (Other Distros)
Recommended for most users. This script handles file copying and optional configuration:
```bash
git clone https://github.com/xCaptaiN09/pixie-sddm.git
cd pixie-sddm
sudo ./install.sh
```

### 3. NixOS (Declarative)
NixOS users should add the following snippet to their `/etc/nixos/configuration.nix`:

```nix
{ pkgs, ... }: {
  services.displayManager.sddm = {
    enable = true;
    theme = "pixie";
  };

  environment.systemPackages = [
    (pkgs.stdenv.mkDerivation {
      name = "pixie-sddm";
      src = pkgs.fetchFromGitHub {
        owner = "xCaptaiN09";
        repo = "pixie-sddm";
        rev = "main";
        sha256 = "sha256-0000000000000000000000000000000000000000000="; # Nix will prompt for the correct hash
      };
      installPhase = ''
        mkdir -p $out/share/sddm/themes/pixie
        cp -r * $out/share/sddm/themes/pixie/
      '';
    })
    pkgs.kdePackages.qtdeclarative
    pkgs.kdePackages.qtquickcontrols2
    pkgs.kdePackages.qtsvg
    pkgs.kdePackages.qteffects
  ];
}
```

After editing, apply the configuration by running:
```bash
sudo nixos-rebuild switch
```

> [!TIP]
> **First-time build:** Nix will likely report a "hash mismatch" error because of the dummy `sha256` value. Simply copy the **actual hash** from the error message, update it in your config, and run the rebuild command again.

### 4. Manual
1. Clone the repository:
   ```bash
   git clone https://github.com/xCaptaiN09/pixie-sddm.git
   ```
2. Copy the folder to SDDM themes directory:
   ```bash
   sudo cp -r pixie-sddm /usr/share/sddm/themes/pixie
   ```
3. Set the theme in `/etc/sddm.conf`:
   ```ini
   [Theme]
   Current=pixie
   ```

---

## 🛠 Configuration & Testing

### Preview Without Logging Out
Run this command to preview the theme:
```bash
sddm-greeter --test-mode --theme /usr/share/sddm/themes/pixie
```

---

## 🎨 Customization

Edit the `theme.conf` file inside the theme directory:
- **Wallpaper:** Replace `assets/background.jpg` with your own image.
- **Avatar:** Put your profile picture in `assets/avatar.jpg`.
- **Colors:** Adjust `accentColor` for manual overrides if needed.

## 🤝 Credits

- **Author:** [xCaptaiN09](https://github.com/xCaptaiN09)
- **Design:** Inspired by Google Pixel and MD3.
- **Font:** Google Sans Flex (included).

---
*Made with ❤️ for the Linux community.*
