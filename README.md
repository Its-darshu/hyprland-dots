# Hyprland Dotfiles — Fedora

My Hyprland compositor config for Fedora 43+. Catppuccin-inspired theme with blur, rounded corners, and smooth animations.

## Quick Install

```bash
bash setup-hyprland-fedora.sh
```

Then log out and select **Hyprland** as your session at the login screen.

## What's Included

| File | Purpose |
|------|---------|
| `hyprland.conf` | Main config — theme, animations, input |
| `keybinds.conf` | All keyboard shortcuts |
| `autostart.conf` | Apps launched on startup |
| `hypridle.conf` | Idle / screen timeout rules |
| `rules.conf` | Window & workspace rules |
| `setup-hyprland-fedora.sh` | One-shot package installer |

## Key Bindings

| Key | Action |
|-----|--------|
| `Super + Enter` | Terminal (kitty) |
| `Super + Q` | Close window |
| `Super + A` | App launcher (fuzzel) |
| `Super + E` | File manager (thunar) |
| `Super + B` | Browser (firefox) |
| `Super + F` | Fullscreen |
| `Super + V` | Toggle floating |
| `Super + L` | Lock screen |
| `Super + P` | Power menu |
| `Super + S` | Screenshot region |
| `Print` | Full screenshot |
| `Super + 1-9` | Switch workspace |
| `Super + Shift + 1-9` | Move window to workspace |
| `Super + Tab` | Next workspace |
| `Super + Shift + Tab` | Previous workspace |
| `Super + arrows` | Move focus |
| `Super + Alt + arrows` | Resize window |

## Apps Used

- **Terminal**: kitty
- **Launcher**: fuzzel
- **Bar**: waybar
- **Wallpaper**: hyprpaper / swww
- **Lock**: hyprlock
- **Idle**: hypridle
- **Notifications**: dunst
- **File manager**: thunar
