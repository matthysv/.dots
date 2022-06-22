#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

setxkbmap "us(intl)" &
xsetroot -cursor_name left_ptr &

#Find out your monitor name with xrandr or arandr (save and you get this line)
#xrandr --output DP-0 --primary --mode 2560x1440 --rate 144.00 --output HDMI-0 --mode 1920x1080 --rate 60.00 --left-of DP-0 --rotate left
autorandr horizontal

#Set monitor color profile using argyllcms
#dispwin -d1 ~/.config/icm/160.icm

picom --config $HOME/.config/picom/picom.conf &
$HOME/.config/polybar/launch.sh &
run sxhkd &

#Wallpaper
feh --bg-fill $HOME/.config/bspwm/wall.png &
#feh --bg-fill ~/.config/bspwm/wall.jpg &
#wal -i ~/Pictures/Wallpapers/example.jpg &

xrdb merge ~/.Xresources &
#run nm-applet &
#blueman-applet &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
#/usr/lib/xfce4/notifyd/xfce4-notifyd &
dunst -config ~/.config/dunst/dunstrc &
#run volumeicon &
#flatpak run com.discordapp.Discord &
#run kdeconnect-indicator &
#~/.config/bspwm/scripts/runmpd &
#steam-runtime -silent &
#/usr/bin/emacs --daemon &
