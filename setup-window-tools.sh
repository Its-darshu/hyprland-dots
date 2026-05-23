#!/usr/bin/env bash
# One-time installer for the Alt+Tab / Super+Tab window switcher (hyprswitch).
# Safe to re-run. Asks for sudo only for the system GTK dependency.

set -euo pipefail

echo "==> [1/4] Installing GTK layer-shell deps (sudo)…"
sudo dnf install -y gtk4-devel gtk4-layer-shell gtk4-layer-shell-devel

echo "==> [2/4] Building hyprswitch via cargo (this can take a few minutes)…"
# --locked builds against hyprswitch's shipped Cargo.lock; without it cargo may
# pull a newer transitive dep (e.g. zbus) that fails to compile.
cargo install hyprswitch --locked

BIN="$HOME/.cargo/bin/hyprswitch"
if [ ! -x "$BIN" ]; then
    echo "ERROR: hyprswitch missing at $BIN after install." >&2
    exit 1
fi
echo "    installed: $("$BIN" --version 2>/dev/null || echo "$BIN")"

echo "==> [3/4] (re)starting the switcher daemon…"
pkill -x hyprswitch 2>/dev/null || true
sleep 0.3
hyprctl dispatch exec -- "$HOME/.config/hypr/scripts/switcher.sh init"

echo "==> [4/4] reloading Hyprland config…"
hyprctl reload

echo
echo "Done. Try it now:"
echo "  • Alt+Tab      hold Alt, tap Tab to cycle, release Alt to switch"
echo "  • Alt+Shift+Tab  cycle backwards"
echo "  • Super+Tab    grid overview of every window across all workspaces"
