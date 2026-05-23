#!/usr/bin/env bash
# PATH-safe wrapper around hyprswitch (cargo installs it to ~/.cargo/bin, which
# isn't always on Hyprland's session PATH). Used by the Alt+Tab / Super+Tab
# binds and the autostart daemon.

export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$PATH"

if ! command -v hyprswitch >/dev/null 2>&1; then
    command -v notify-send >/dev/null 2>&1 && \
        notify-send "hyprswitch not installed" "Run: bash ~/Project/hyperland/setup-window-tools.sh"
    exit 1
fi

if [ "${1:-}" = "init" ]; then
    shift
    exec hyprswitch init --show-title "$@"
fi

exec hyprswitch "$@"
