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

#Set monitor color profile using argyllcms
#dispwin -d1 ~/.config/icm/160.icm

$HOME/.config/polybar/launch.sh &

#change your keyboard if you need it
#setxkbmap -layout be

keybLayout=$(setxkbmap -v | awk -F "+" '/symbols/ {print $2}')

run sxhkd &

#Wallpaper
feh --bg-fill $HOME/.config/bspwm/wall.png &
#feh --bg-fill ~/.config/bspwm/wall.jpg &
#wal -i ~/Pictures/Wallpapers/example.jpg &

xsetroot -cursor_name left_ptr &

xrdb merge ~/.Xresources

#run nm-applet &
#run xfce4-power-manager &
numlockx on &
#blueman-applet &
picom --config $HOME/.config/bspwm/picom.conf &
#/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
#/usr/lib/xfce4/notifyd/xfce4-notifyd &
#run volumeicon &

#run discord &
#run kdeconnect-indicator &
#run noisetorch &
#mpd &
#/usr/bin/emacs --daemon &
