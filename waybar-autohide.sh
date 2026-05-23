#!/usr/bin/env bash
# Reveal waybar when the cursor touches the bottom screen edge; hide it otherwise.
#
# Uses PID tracking to detect waybar restarts and resync state — prevents
# the inverted-toggle bug that occurs after any manual waybar restart.

reveal_margin=6     # reveal when cursor is within this many px of the bottom edge
hide_margin=44      # hide when cursor moves above this many px from the bottom (bar is ~40px tall)
poll=0.12           # seconds between cursor checks

# Logical screen height (bottom edge in cursorpos coords); recomputed on resolution changes.
screen_height() {
    hyprctl monitors -j 2>/dev/null \
        | jq -r 'first(.[] | select(.focused)) // .[0] | (.height / .scale) | floor'
}

until pgrep -x waybar >/dev/null; do sleep 0.3; done
sleep 0.5
pkill -SIGUSR1 -x waybar
visible=0
last_pid=$(pgrep -x waybar | head -1)
sh=$(screen_height)

while sleep "$poll"; do
    cur_pid=$(pgrep -x waybar | head -1)
    [ -z "$cur_pid" ] && continue

    # Waybar restarted — it comes back visible; re-hide and resync
    if [ "$cur_pid" != "$last_pid" ]; then
        sleep 0.5
        pkill -SIGUSR1 -x waybar
        visible=0
        last_pid="$cur_pid"
        continue
    fi

    y=$(hyprctl cursorpos -j 2>/dev/null | jq -r '.y // empty')
    [ -z "$y" ] && continue
    [ -z "$sh" ] && sh=$(screen_height) && [ -z "$sh" ] && continue

    reveal_at=$((sh - reveal_margin))   # near the bottom edge
    hide_at=$((sh - hide_margin))       # moved up off the bar

    if [ "$visible" -eq 0 ] && [ "$y" -ge "$reveal_at" ]; then
        pkill -SIGUSR1 -x waybar && visible=1
    elif [ "$visible" -eq 1 ] && [ "$y" -le "$hide_at" ]; then
        pkill -SIGUSR1 -x waybar && visible=0
    fi
done
