# .dots
This is a guide to get a minimal arch linux system running with BSPWM. Some files are based on my modified configs from an arco linux system. There are no special scripts.

## Easy install

Run archinstall and choose the xorg option with the appropriate display drivers.

## Connecting to wifi on vanilla arch:

### With iwd
```
iwctl
device list
```
In this case out wifi device is wlan0, and the network is NETWORKNAME.
```
station wlan0 get-networks
station wlan0 connect NETWORKNAME
```
Press CTRL+D to leave the prompt.

### With NetworkManager
Enable and start NetworkManager and wpa_suplicant services (for wireless connections):
```
sudo systemctl enable NetworkManager.service
sudo systemctl enable wpa_supplicant.service
sudo systemctl start NetworkManager.service
```
Make sure conflicting services such as dhcpcd are disabled:
```
sudo systemctl disable dhcpcd.service
```
Reboot to make sure changes take effect:
```
sudo reboot now
```
Then find a device and connect. In this case the network is NETWORKNAME and pass is PASS
```
nmcli device wifi list
nmcli device wifi connect NETWORKNAME password PASS
```

## Need to install:

### Utilities:
- btop
- cargo
- curl
- ffmpeg
- git
- grep
- mpv
- ntp
- ranger
- sed
- vim
- zathura-pdf-mupdf
- zsh
- zsh-completions
- zsh-syntax-highlighting

### Desktop and Display manager:
- xorg (or xorg-server) ~ Install this if you did not follow my directions for archinstall
- argyllcms
- awesome-terminal-fonts
- bspwm
- dunst
- feh
- gvfs
- lxappearance
- picom
- rofi
- rxvt-unicode
- lightdm
- lightdm-gtk-greeter
- lightdm-gtk-greeter-settings
- sxhkd
- thunar
- thunar-archive-plugin
- thunar-volman
- xorg-font-util
- xorg-xrandr
- xorg-xsetroot

### System tray (optional):
- network-manager-applet
- volumeicon

### Nvidia packages
- For normal kernel: nvidia
- For zen kernel: nvidia-dkms
- For LTS kernel: nvidia-lts
- nvidia-settings
- nvidia-utils
- nvidia-xrun

### Sound Essentials:
- alsa-firmware
- alsa-lib
- alsa-plugins
- alsa-utils
- pavucontrol
- playerctl
- pulseaudio
- pulseaudio-alsa

### Additional reccomended packages
- emacs
- meld
- ncmpcpp and mpd
- w3m

#### Install paru if you don't have it already:
```
sudo pacman -S base-devel --needed
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

#### From AUR (with paru):
- hblock
- nerd-fonts-source-code-pro
- pokemon-colorscripts-git
- polybar
- roccat-tools-tyon
- shell-color-scripts
- urxvt-resize-font-git

# Enable multilib
In vanilla arch, multilib is disabled by default. If you wish to enable it, edit /etc/pacman.conf and uncomment the following lines:
```
[multilib]
Include = /etc/pacman.d/mirrorlist
```

# Install dotfiles
```
git clone https://github.com/matthysv/.dots
```
After installing needed packages and placing dotfiles in the appropriate directories, run this command to enable lightdm:
```
sudo systemctl enable lightdm
```
And reboot.

# Finishing up and installing additional software

#### Setup timezone
Turn NTP on
```
sudo timedatectl set-ntp true
```
Find and set time zone:
```
timedatectl list-timezones
timedatectl set-timezone America/New_York
```
#### Setting up roccat-tools
Roccat tools needs you to run this command to give it the proper permissions:
```
sudo usermod -a -G roccat $USER
```

#### Setting up zsh
Set up zsh. Make sure .zshrc is not in the home directory. You can rename it.
```
zsh
```
change shell to zsh
```
chsh -s /usr/bin/zsh
```



#### Install Doom Emacs
```
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
```

#### Install ani-cli
```
git clone https://github.com/pystardust/ani-cli.git
cd ani-cli
sudo make install
```

#### Dracula GTK widget theming and icons
```
git clone https:/github.com/dracula/gtk.git
sudo cp -r gtk /usr/share/themes
git clone https://github.com/matheuuus/dracula-icons
sudo cp -r dracula-icons /usr/share/icons
```
#### Theming
Use lxappearance to set the appearance of gtk applications as well as the mouse pointer. Set the cursor on bspwm with the following command:
```
xsetroot -cursor_name left_ptr
```

#### If you need to update Dracula rofi theme
```
git clone https://github.com/dracula/rofi
cp rofi/theme/config1.rasi ~/.config/rofi/config.rasi
```

