#!/usr/bin/env sh

# More info : https://github.com/jaagr/polybar/wiki

# Uses awesome-terminal-fonts or nerd-fonts
# --log=error
# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

desktop=$(echo $DESKTOP_SESSION)

polybar --reload mainbar-left -c ~/.config/polybar/config.ini &
polybar --reload mainbar-center -c ~/.config/polybar/config.ini &
#polybar --reload mainbar-right -c ~/.config/polybar/config.ini &
# Uncomment below for second screen polybar
#polybar --reload secondary-left -c ~/.config/polybar/config.ini &
#polybar --reload secondary-center -c ~/.config/polybar/config.ini &
#polybar --reload secondary-right -c ~/.config/polybar/config.ini &
