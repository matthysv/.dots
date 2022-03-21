# .dots
These are my public dotfiles. With the listed packages, they should work on arch and arch-based distros, but I will also try to accomodate debian-based distros. This repo includes configs for: 
BSPWM with sxhkd, picom and polybar.
Doom Emacs
MangoHud
mpd with mpc and ncmpcpp
neofetch
ranger
rofi
urxvt
uxterm and xterm
xfce terminal
zsh

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

## Packages to install:

### Display manager (pick one):
- lightdm
- ly
```
git clone --recurse-submodules https://github.com/nullgemm/ly.git
sudo make install
```
### Utilities:
- bat
- btop
- cargo
- curl
- exa
- fd
- ffmpeg
- git
- grep
- jq
- maim
- mpv
- ntp
- pcmanfm
- ranger
- ripgrep
- sed
- vim
- xclip
- zathura-pdf-mupdf
- zsh
- zsh-completions
- zsh-syntax-highlighting

####GPU Monitors
- AMD - radeontop
- Intel - intel-gpu-tools - intel_gpu_top
- Nvidia - nvtop

### Desktop and Display manager:
- argyllcms (for color profile)
- autorandr
- awesome-terminal-fonts
- bspwm
- feh
- gvfs
- lxappearance
- picom
- rofi
- rofi-emoji
- rxvt-unicode
- libwnck3
- mesa-utils
- sxhkd
- xf86-input-libinput
- xorg-font-util
- xorg-server
- xorg-xbacklight
- xorg-xdpyinfo
- xorg-xinput
- xorg-xkill
- xorg-xrandr
- xorg-xsetroot

### System tray (optional):
- network-manager-applet
- volumeicon

### Nvidia packages
- For normal kernel: nvidia
- For zen kernel: nvidia-dkms nvidia-dkms-headers
- For LTS kernel: nvidia-lts nvidia-lts-headers
- nvidia-settings
- nvidia-utils
- nvidia-xrun

### Sound Essentials:
- alsa-firmware
- alsa-lib
- alsa-plugins
- alsa-utils
- pavucontrol
- pipewire
- pipewire-pulse
- pipewire-alsa
- pipewire-jack
- pipewire-media-session

### Additional reccomended packages
- emacs
- meld
- ncmpcpp, mpc and mpd
- w3m

#### Install paru if you don't have an AUR helper

```
cargo install paru
```
Or without cargo:
```
sudo pacman -S base-devel --needed
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

#### From AUR
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
After installing needed packages and placing dotfiles in the appropriate directories, run this command to enable lightdm. You can substitute lightdm with ly if you prefer:
```
sudo systemctl enable lightdm
```
And reboot.

# Finishing up and installing additional software

#### fstrim
If you are using an SSD, enable the fstrim timer.
```
systemctl enable fstrim.timer
```

#### TLP
TLP is an optional package you can install to improve battery performance on laptops. It conflicts with power-profiles-daemon, which may be installed by default on some arch-based distribuions. Additional packages may be needed for full functionality on ThinkPads. Refer to the arch wiki if you wish to use TLP: https://wiki.archlinux.org/title/TLP

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

#### Change shell to zsh
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

#### Install st
```
git clone https://github.com/siduck/st
cd st
sudo make install
```

#### Install yt-rofi
```
git clone https://github.com/kushagraa-j/youtube-rofi.git
cd youtube-rofi
sudo make install
```

#### Dracula GTK widget theming and icons
```
git clone https://github.com/dracula/gtk.git
sudo cp -r gtk /usr/share/themes
git clone https://github.com/matheuuus/dracula-icons
sudo cp -r dracula-icons /usr/share/icons
```
Use lxappearance to set the appearance of gtk applications as well as the mouse pointer.
