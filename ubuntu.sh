# LAST UBUNTU VERSION TESTED: 22.04 LTS
# Desktop environment: GNOME

###############################################################################
#                                   BASICS                                    #
###############################################################################

# Upgrade, configure graphics, and REBOOT

sudo apt install git make

# Use Vanilla GNOME (choose Xorg GNOME in GDM after reboot)
sudo apt install -y gnome-session
#sudo update-alternatives --config gdm3.css

# Remove unwanted software
sudo apt remove -y gnome-mines gnome-mahjongg shotwell \
gnome-sudoku gnome-todo aisleriot totem firefox

# Firefox ESR
sudo apt install -y software-properties-common apt-transport-https
sudo add-apt-repository -y ppa:mozillateam/ppa
sudo apt update
sudo apt install -y firefox-esr

# REBOOT

###############################################################################
#                                   SOFTWARE                                  #
###############################################################################

# Fonts
sudo apt install -y fonts-cantarell fonts-noto
sudo apt install -y ttf-mscorefonts-installer
wget https://github.com/adobe-fonts/source-code-pro/archive/1.017R.zip && \
unzip 1.017R.zip && sudo mv source-code-pro-1.017R/OTF/*.otf \
/usr/local/share/fonts/ && fc-cache -f -v && rm 1.017R.zip && rm -Rf \
source-code-pro-1.017R

# Japanese and Chinese input
sudo apt install -y ibus-anthy ibus-libpinyin libpinyin-utils

# Install software
sudo apt install -y p7zip unrar mpv rhythmbox gimp inkscape brasero \
screenfetch neofetch kid3 gnome-tweaks keepassxc virtualbox linphone \
soundconverter gparted audacity anki geogebra thunderbird gnome-clocks

# Custom GNOME shortcuts
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up \
"['<Super>Page_Up', '<Control><Alt>Up', '<Control><Alt>k']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down \
"['<Super>Page_Down', '<Control><Alt>Down', '<Control><Alt>j']"

# Clean packages
#sudo apt autoremove

# NodeJS
sudo apt install -y nodejs npm
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
hash -r
sudo npm update
sudo npm install -g typescript
sudo npm install -g cordova

# Android
sudo apt install -y android-tools-adb
sudo apt install -y openjdk-11-jdk
sudo apt install -y openjdk-8-jdk
sudo add-apt-repository -y ppa:maarten-fonville/android-studio
sudo apt update
sudo apt install -y android-studio gradle android-sdk-build-tools

# LaTeX
sudo apt install -y latexmk luatex
sudo apt install --install-recommends texlive-full

# Telegram
wget -O telegram.tar.xz https://telegram.org/dl/desktop/linux
tar -xvf telegram.tar.xz
rm telegram.tar.xz
mv Telegram ~/.telegram-desktop-dir
~/.telegram-desktop-dir/Telegram