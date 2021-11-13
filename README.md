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
- sed
- vim
- zsh
- zsh-completions
- zsh-syntax-highlighting

### Desktop and Display manager:
- xorg (or xorg-server)
- xorg-xrandr
- awesome-terminal-fonts
- bspwm
- dunst
- feh
- gvfs
- lxappearance
- network-manager-applet
- sddm
- sxhkd
- picom
- rofi
- rxvt-unicode
- thunar
- thunar-archive-plugin
- xorg-font-util
- xorg-xsetroot

### Nvidia packages
- For normal kernel: nvidia
- For zen kernel: nvidia-dkms
- For LTS kernel: nvidia-lts
- nvidia-settings
- nvidia-utils
- nvidia-xrun

### Sound Essentials:
- pulseaudio
- pulseaudio-alsa
- pavucontrol
- alsa-firmware
- alsa-lib
- alsa-plugins
- alsa-utils
- playerctl
- volumeicon

### Additional reccomended packages
- ranger
- w3m
- emacs
- iwd
- meld
- thunar-volman

#### Install paru if you don't have it already:
```
sudo pacman -S base-devel --needed
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

#### From AUR (with paru):
- multicolor-sddm-theme
- nerd-fonts-source-code-pro
- pokemon-colorscripts-git
- polybar
- shell-color-scripts
- urxvt-resize-font-git

# Enable multilib
In vanilla arch, multilib is disabled by default. To enable it, edit /etc/pacman.conf and uncomment the following lines:
```
[multilib]
Include = /etc/pacman.d/mirrorlist
```

# Install dotfiles
```
git clone https://github.com/matthysv/.dots
```
After installing needed packages and placing dotfiles in the appropriate directories, run this command to enable sddm:
```
sudo systemctl enable sddm.service -f
```
And reboot. To change sddm theme:
```
sudo vim /usr/lib/sddm/sddm.conf.d/default.conf
```
Edit the file specifying desired theme. In this case we use the one we got from the AUR:
```
[Theme]
Current=multicolor-sddm-theme
```
multicolor-sddm-theme config is located at /usr/share/sddm/themes/multicolor-sddm-theme/theme.conf
```
[General]
background=png/dracula-01.png
displayFont="Raleway"
```

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

