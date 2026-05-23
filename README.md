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
- **No wallpaper** — starts with a plain black background; set one manually with `swww-daemon & swww img /path/to/image.jpg`
- **Hover to focus** — move your mouse over any window to make it active instantly, no clicking needed
- **Side-by-side tiling** — new windows always split to the right, dividing the screen equally (50/50)
- **Same workspace** — all apps open in your current workspace, nothing jumps to another
- **No borders** — windows have no border, only shadow and rounding for separation

## Key Bindings

### Apps
| Key | Action |
|-----|--------|
| `Super + Enter` | Terminal (gnome-terminal) |
| `Super + Q` | Close window |
| `Super + A` | App launcher (fuzzel) |
| `Super + E` | File manager (thunar) |
| `Super + B` | Browser (brave) |

### Window Management
| Key | Action |
|-----|--------|
| `Super + Up` | Maximize — or restore the most recently minimized window |
| `Super + Down` | Minimize (hide) window |
| `Super + F` | Fullscreen |
| `Super + V` | Toggle floating |
| `Super + J` | Toggle split direction (dwindle) |
| `Super + ;` | Pseudotile (dwindle) |
| `Super + Shift + arrows` | Move window (within workspace) |
| `Super + Alt + arrows` | Resize window |
| `Super + Left / Right` | Move focus left / right |
| `Super + Ctrl + H/J/K/L` | Move focus (vim keys) |
| `Super + LMB drag` | Move window (within workspace) |
| `Super + RMB drag` | Resize window |

### Window Switcher (hyprswitch)
> One-time install required: `bash setup-window-tools.sh`

| Key | Action |
|-----|--------|
| `Alt + Tab` | Hold Alt, tap Tab to cycle through all windows (across every workspace, incl. minimized); release Alt to switch |
| `Alt + Shift + Tab` | Same, cycling backwards |
| `Super + Tab` | Grid overview of every window grouped by workspace |

### Session
| Key | Action |
|-----|--------|
| `Super + L` | Lock screen |
| `Super + P` | Power menu (wlogout) |
| `Super + Shift + M` | Exit Hyprland |

### Screenshots
| Key | Action |
|-----|--------|
| `Super + S` | Screenshot region (saved to ~/Pictures/Screenshots) |
| `Super + Shift + S` | Screenshot region → clipboard |
| `Print` | Full screenshot |

### Workspaces
| Key | Action |
|-----|--------|
| `Super + 1-9, 0` | Switch to workspace 1–10 |
| `Super + Shift + 1-9, 0` | Move window to workspace 1–10 (stay put) |
| `Super + Ctrl + Left / Right` | Move window to the adjacent workspace and follow it |
| `Super + scroll` | Cycle workspaces on bar |

> `Super + Tab` opens the window overview (see **Window Switcher** above), not workspace cycling.

### Scratchpad
| Key | Action |
|-----|--------|
| `Super + ~` | Toggle scratchpad |
| `Super + Shift + ~` | Move window to scratchpad |

### Media & System
| Key | Action |
|-----|--------|
| `XF86AudioRaiseVolume` | Volume up 5% |
| `XF86AudioLowerVolume` | Volume down 5% |
| `XF86AudioMute` | Toggle mute |
| `XF86AudioMicMute` | Toggle mic mute |
| `XF86MonBrightnessUp` | Brightness up 5% |
| `XF86MonBrightnessDown` | Brightness down 5% |
| `XF86AudioNext/Prev` | Next / previous track |
| `XF86AudioPlay/Pause` | Play / pause |

## Apps Used

- **Terminal**: gnome-terminal
- **Launcher**: fuzzel
- **Window switcher**: hyprswitch (Alt+Tab / Super+Tab overview)
- **Bar**: waybar
- **Wallpaper**: swww (disabled at startup — run manually)
- **Lock**: hyprlock
- **Idle**: hypridle
- **Notifications**: dunst
- **File manager**: thunar
- **Power menu**: wlogout
- **Network tray**: nm-applet
- **Bluetooth tray**: blueman-applet
- **Clipboard**: cliphist + wl-paste
