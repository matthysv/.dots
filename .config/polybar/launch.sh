#!/usr/bin/env sh

# More info : https://github.com/jaagr/polybar/wiki

# Uses awesome-terminal-fonts or nerd-fonts
# --log=error
# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

desktop=$(echo $DESKTOP_SESSION)

polybar --reload mainbar-bspwm -c ~/.config/polybar/config &
# Uncomment for second polybar
#polybar --reload mainbar-bspwm-extra -c ~/.config/polybar/config &
