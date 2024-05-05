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
soundconverter gparted audacity geogebra thunderbird

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

sudo apt install sway swaylock swayidle swaybg waybar foot fuzzel policykit-1

cp tiling-wm-config/.gtkrc-2.0 ~/.gtkrc-2.0
mkdir -p ~/.config/gtk-3.0
cp tiling-wm-config/.config/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini
mkdir -p ~/.config/sway
cp tiling-wm-config/.config/sway/config ~/.config/sway/config
mkdir -p ~/.config/waybar
cp tiling-wm-config/.config/waybar/config ~/.config/waybar/config
cp tiling-wm-config/.config/waybar/style.css ~/.config/waybar/style.css
mkdir -p ~/.config/foot
cp tiling-wm-config/.config/foot/foot.ini ~/.config/foot/foot.ini

# TODO: DBeaver

# TODO: Chrome

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