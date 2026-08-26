#!/usr/bin/env bash
# Unified directional focus across tmux panes and AeroSpace windows.
#
# Bound to alt-h/j/k/l in aerospace.toml. When the terminal is focused and
# there is a tmux pane in the requested direction, move to that pane;
# otherwise fall through to moving between macOS windows. One keystroke
# walks across panes and then keeps going across windows.

set -uo pipefail
export PATH="/opt/homebrew/bin:/usr/bin:/bin:/usr/sbin:/sbin:${PATH:-}"

readonly TERMINAL_BUNDLE_ID="org.alacritty"

dir="${1:-}"
case "$dir" in
  left)  pane_dir=L; at_edge="pane_at_left"   ;;
  down)  pane_dir=D; at_edge="pane_at_bottom" ;;
  up)    pane_dir=U; at_edge="pane_at_top"    ;;
  right) pane_dir=R; at_edge="pane_at_right"  ;;
  *) echo "usage: ${0##*/} left|down|up|right" >&2; exit 64 ;;
esac

focused_app() { aerospace list-windows --focused --format '%{app-bundle-id}' 2>/dev/null; }

# Only tmux gets a say when the terminal is actually the focused window --
# otherwise a keypress aimed at Chrome would silently move a hidden pane.
if [[ "$(focused_app)" == "$TERMINAL_BUNDLE_ID" ]] && tmux has-session 2>/dev/null; then
  # Resolved inside tmux so the edge check and the move are one round trip.
  if tmux if-shell -F "#{${at_edge}}" \
       "run-shell 'aerospace focus ${dir}'" \
       "select-pane -${pane_dir}" 2>/dev/null; then
    exit 0
  fi
fi

exec aerospace focus "$dir"
