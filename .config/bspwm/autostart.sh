#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

#Find out your monitor name with xrandr or arandr (save and you get this line)

#xrandr --output DP-0 --primary --mode 2560x1440 --rate 144.00 --output HDMI-0 --mode 1920x1080 --rate 60.00 --left-of DP-0 --rotate left
autorandr horizontal

#dispwin -d1 /home/matthys/.config/icm/160.icm

$HOME/.config/polybar/launch.sh &

#change your keyboard if you need it
#setxkbmap -layout be

keybLayout=$(setxkbmap -v | awk -F "+" '/symbols/ {print $2}')

run sxhkd &

#Some ways to set your wallpaper besides variety or nitrogen
feh --bg-fill ~/.config/bspwm/wall.png &
#feh --bg-fill ~/.config/bspwm/wall.jpg &
#wal -i ~/Pictures/Wallpapers/oldchinesetown.jpg &

xsetroot -cursor_name left_ptr &

#run variety &
#run nm-applet &
run xfce4-power-manager &
numlockx on &
#blueberry-tray &
picom --config $HOME/.config/bspwm/picom.conf &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
#run volumeicon &

#run discord &
#run discord-canary &
#run kdeconnect-indicator &
#run noisetorch &
#run spotify &
#run atom &
#mpd
/usr/bin/emacs --daemon &

export PATH=/home/matthys/.cargo/bin
