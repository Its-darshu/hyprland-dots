# hyperCLI — Hyprland Dotfiles for Fedora

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
| `waybar/config` | Status bar layout |
| `waybar/style.css` | Status bar styling |
| `setup-hyprland-fedora.sh` | One-shot package installer |

## Behaviour

- **Startup** — gnome-terminal opens automatically when Hyprland starts
- **No wallpaper** — starts with a plain black background; set one manually when needed
- **Hover to focus** — move your mouse over any window to make it active instantly, no clicking needed
- **Side-by-side tiling** — new windows always split to the right, dividing the screen equally (50/50)
- **Same workspace** — all apps open in your current workspace, nothing jumps to another

## Key Bindings

### Apps
| Key | Action |
|-----|--------|
| `Super + Enter` | Terminal (gnome-terminal) |
| `Super + Q` | Close window |
| `Super + A` | App launcher (fuzzel) |
| `Super + E` | File manager (thunar) |
| `Super + B` | Browser (firefox) |

### Window Management
| Key | Action |
|-----|--------|
| `Super + Up` | Maximize / restore window |
| `Super + Down` | Minimize (hide) window |
| `Super + Ctrl + Down` | Show minimized windows |
| `Super + F` | Fullscreen |
| `Super + V` | Toggle floating |
| `Super + Shift + arrows` | Move window |
| `Super + Alt + arrows` | Resize window |
| `Super + Ctrl + H/J/K/L` | Move focus (vim keys) |

### Session
| Key | Action |
|-----|--------|
| `Super + L` | Lock screen |
| `Super + P` | Power menu |
| `Super + Shift + M` | Exit Hyprland |

### Screenshots
| Key | Action |
|-----|--------|
| `Super + S` | Screenshot region (saved to ~/Pictures/screenshots) |
| `Super + Shift + S` | Screenshot region → clipboard |
| `Print` | Full screenshot |

### Workspaces
| Key | Action |
|-----|--------|
| `Super + 1-9` | Switch workspace |
| `Super + Shift + 1-9` | Move window to workspace |
| `Super + Tab` | Next workspace |
| `Super + Shift + Tab` | Previous workspace |

## Apps Used

- **Terminal**: gnome-terminal
- **Launcher**: fuzzel
- **Bar**: waybar
- **Wallpaper**: swww
- **Lock**: hyprlock
- **Idle**: hypridle
- **Notifications**: dunst
- **File manager**: thunar
