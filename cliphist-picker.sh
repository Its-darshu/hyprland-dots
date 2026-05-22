#!/usr/bin/env bash
# Clipboard history picker: opens fuzzel in dmenu mode and closes it if the
# mouse moves (same move-to-close behaviour as launcher.sh).

threshold=10
poll=0.05

if pgrep -x fuzzel >/dev/null; then
    pkill -x fuzzel
    exit 0
fi

read -r sx sy < <(hyprctl cursorpos -j 2>/dev/null | jq -r '"\(.x) \(.y)"')

# Snapshot clipboard list now so fuzzel can run as a plain background job
# (gives us a clean $! pointing straight at fuzzel's PID)
tmpin=$(mktemp)
tmpout=$(mktemp)
cliphist list > "$tmpin"

fuzzel --dmenu < "$tmpin" > "$tmpout" &
fpid=$!
rm -f "$tmpin"

while kill -0 "$fpid" 2>/dev/null; do
    read -r cx cy < <(hyprctl cursorpos -j 2>/dev/null | jq -r '"\(.x) \(.y)"')
    if [[ "$cx" =~ ^-?[0-9]+$ && "$cy" =~ ^-?[0-9]+$ ]]; then
        dx=$(( cx - sx )); dy=$(( cy - sy ))
        (( dx < 0 )) && dx=$(( -dx ))
        (( dy < 0 )) && dy=$(( -dy ))
        if (( dx + dy > threshold )); then
            kill "$fpid" 2>/dev/null
            rm -f "$tmpout"
            exit 0
        fi
    fi
    sleep "$poll"
done

if [[ -s "$tmpout" ]]; then
    cliphist decode < "$tmpout" | wl-copy
fi
rm -f "$tmpout"
