# LAST UBUNTU VERSION TESTED: 24.04 LTS (KUBUNTU)
# Desktop environment: Sway (also KDE)

###############################################################################
#                                   BASICS                                    #
###############################################################################

# Upgrade, configure graphics, and REBOOT

sudo apt install git make

# REBOOT

###############################################################################
#                                   SOFTWARE                                  #
###############################################################################

# Fonts
sudo apt install fonts-cantarell fonts-noto
sudo apt install ttf-mscorefonts-installer
wget https://github.com/adobe-fonts/source-code-pro/archive/1.017R.zip && \
unzip 1.017R.zip && sudo mv source-code-pro-1.017R/OTF/*.otf \
/usr/local/share/fonts/ && fc-cache -f -v && rm 1.017R.zip && rm -Rf \
source-code-pro-1.017R

# Japanese and Chinese input
sudo apt install ibus-anthy ibus-libpinyin libpinyin-utils

# Install software
sudo apt install p7zip unrar mpv rhythmbox gimp inkscape brasero \
screenfetch neofetch kid3 keepassxc virtualbox \
soundconverter gparted audacity geogebra thunderbird meld

# NodeJS
sudo apt install nodejs npm
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
hash -r
sudo npm update
sudo npm install -g typescript
sudo npm install -g cordova

# Android
sudo apt install android-tools-adb openjdk-11-jdk openjdk-8-jdk
sudo add-apt-repository ppa:maarten-fonville/android-studio
sudo apt update
sudo apt install android-studio gradle android-sdk-build-tools

# Telegram
wget -O telegram.tar.xz https://telegram.org/dl/desktop/linux
tar -xvf telegram.tar.xz
rm telegram.tar.xz
mv Telegram ~/.telegram-desktop-dir
~/.telegram-desktop-dir/Telegram

##################

cp shared/.mekadimo_date.py ~/.mekadimo_date.py
cp shared/.mekadimo_date.awk ~/.mekadimo_date.awk
sudo apt install adwaita-icon-theme
sudo apt install pluma kronometer caja caja-open-terminal
cp shared/gtk/.gtkrc-2.0 ~/.gtkrc-2.0
mkdir -p ~/.config/gtk-3.0
cp shared/gtk/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini
mkdir -p ~/.config/gtk-4.0
cp shared/gtk/gtk-4.0/settings.ini ~/.config/gtk-4.0/settings.ini

# SWAY
########################

sudo apt install sway swaylock swayidle swaybg waybar foot fuzzel policykit-1 grim wl-clipboard slurp
# TODO: swappy

mkdir -p ~/.config/sway
cp sway/config ~/.config/sway/config
mkdir -p ~/.config/waybar
cp sway/waybar/config ~/.config/waybar/config
cp sway/waybar/style.css ~/.config/waybar/style.css
mkdir -p ~/.config/foot
cp sway/foot/foot.ini ~/.config/foot/foot.ini

sudo apt install xdg-desktop-portal-wlr pavucontrol blueman
# TODO?: libpipewire

# Screen-sharing
#https://www.reddit.com/r/swaywm/comments/l4e55v/guide_how_to_screenshare_from_chromiumfirefox/
mkdir -p ~/.config/environment.d/
cp sway/environment.d/sway.conf ~/.config/environment.d/sway.conf

# i3
########################

sudo apt install i3-wm i3status i3lock polybar rofi picom rxvt-unicode scrot feh

sudo apt install pavucontrol blueman

rm -f ~/.Xresources
cp i3/.Xresources ~/.Xresources
mkdir -p ~/.config/i3
rm -f ~/.config/i3/config
cp i3/config ~/.config/i3/config
mkdir -p ~/.config/polybar
rm -f ~/.config/polybar/config.ini
cp i3/polybar/config.ini ~/.config/polybar/config.ini
rm -f ~/.config/polybar/launch.sh
cp i3/polybar/launch.sh ~/.config/polybar/launch.sh
chmod +x ~/.config/polybar/launch.sh

sudo apt install ibus ibus-mozc ibus-libpinyin
ibus-setup

##################

make -p ~/Pictures/Screenshots/

# TODO: DBeaver

# TODO: Chrome
# Enable `enable-webrtc-pipewire-capturer` in `chrome://flags`.

sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https
sudo apt update
sudo apt install code