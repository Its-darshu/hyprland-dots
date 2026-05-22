#!/usr/bin/env bash
# Reveal waybar when the cursor touches the top screen edge; hide it otherwise.
#
# Uses PID tracking to detect waybar restarts and resync state — prevents
# the inverted-toggle bug that occurs after any manual waybar restart.

reveal_at=6     # cursor y (px) at/below this reveals the bar
hide_at=44      # cursor y (px) at/below this hides it (bar is ~40px tall)
poll=0.12       # seconds between cursor checks

until pgrep -x waybar >/dev/null; do sleep 0.3; done
sleep 0.5
pkill -SIGUSR1 -x waybar
visible=0
last_pid=$(pgrep -x waybar | head -1)

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

    if [ "$visible" -eq 0 ] && [ "$y" -le "$reveal_at" ]; then
        pkill -SIGUSR1 -x waybar && visible=1
    elif [ "$visible" -eq 1 ] && [ "$y" -ge "$hide_at" ]; then
        pkill -SIGUSR1 -x waybar && visible=0
    fi
done
