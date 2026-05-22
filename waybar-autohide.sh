#!/usr/bin/env bash
# Reveal waybar when the cursor touches the top screen edge; hide it otherwise.
#
# waybar has no native "start hidden" option, so it always launches visible.
# We hide it once at startup (one SIGUSR1) to put it into a known state, then
# poll the cursor and toggle. Tracking `visible` keeps us in sync with the bar.
#
# Behaviour: cursor at the very top  -> bar appears.
#            cursor moves away below -> bar disappears.

reveal_at=6     # cursor y (px) at/below this reveals the bar
hide_at=44      # cursor y (px) at/below this hides it again (bar is ~40px tall)
poll=0.12       # seconds between cursor checks

# Wait for waybar, then hide it so our state matches reality.
until pgrep -x waybar >/dev/null; do sleep 0.3; done
sleep 0.5
pkill -SIGUSR1 -x waybar
visible=0

while sleep "$poll"; do
    # Stop if waybar went away (e.g. during a reload restart).
    pgrep -x waybar >/dev/null || continue
    y=$(hyprctl cursorpos -j 2>/dev/null | jq -r '.y // empty')
    [ -z "$y" ] && continue
    if [ "$visible" -eq 0 ] && [ "$y" -le "$reveal_at" ]; then
        pkill -SIGUSR1 -x waybar && visible=1
    elif [ "$visible" -eq 1 ] && [ "$y" -ge "$hide_at" ]; then
        pkill -SIGUSR1 -x waybar && visible=0
    fi
done
