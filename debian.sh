# LAST DEBIAN VERSION TESTED: 12
# Desktop environment: GNOME

###############################################################################
#                                   BASICS                                    #
###############################################################################

su

gnome-text-editor /etc/apt/sources.list  # add to all: contrib non-free
# Add:
# # bookworm-backports
# deb http://httpredir.debian.org/debian bookworm-backports main non-free-firmware contrib non-free
# deb-src http://httpredir.debian.org/debian bookworm-backports main non-free-firmware contrib non-free

apt update && apt upgrade

echo "lajto   ALL=(ALL) ALL" >> /etc/sudoers

# REBOOT

###############################################################################
#                                   SOFTWARE                                  #
###############################################################################

sudo apt install -y wget nano git make pulseaudio libcanberra-pulse mpg123 \
libpulse0 libxml2 giflib-tools libc6 gtk2-engines gcc ca-certificates gnupg2 \
gcc-multilib g++ g++-multilib cmake lm-sensors apt-transport-https curl

# 32 bits architecture
sudo dpkg --add-architecture i386
sudo apt update
sudo apt upgrade -y
sudo apt install -y binutils-multiarch libstdc++6:i386 libgcc1:i386 \
zlib1g:i386 libncurses5:i386 libcanberra-pulse:i386 \
libpulse0:i386 libxml2:i386

# NVIDIA drivers
sudo apt install -y linux-headers-$(uname -r|sed 's/[^-]*-[^-]*-//')
sudo apt update
sudo apt install -y nvidia-driver nvidia-driver-libs:i386 \
nvidia-vulkan-icd nvidia-vulkan-icd:i386 firmware-misc-nonfree \
mesa-vulkan-drivers libglx-mesa0:i386 mesa-vulkan-drivers:i386 \
libgl1-mesa-dri:i386
sudo apt install -y nvidia-vaapi-driver # NOTE: Very important for OBS!

# REBOOT

# Compression tools
sudo apt install -y rar unrar p7zip p7zip-full p7zip-rar unace zip unzip \
bzip2 arj lhasa lzip xz-utils

# Codecs
sudo apt install -y ffmpegthumbnailer \
libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev \
libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-base \
gstreamer1.0-plugins-good gstreamer1.0-plugins-bad \
gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-tools \
gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 \
gstreamer1.0-qt5 gstreamer1.0-pulseaudio gstreamer1.0-nice \
gstreamer1.0-vaapi

# Fonts
sudo apt install -y fonts-cantarell fonts-liberation fonts-noto \
ttf-mscorefonts-installer fonts-stix otf-stix \
fonts-oflb-asana-math fonts-mathjax
wget https://github.com/adobe-fonts/source-code-pro/archive/1.017R.zip && \
unzip 1.017R.zip && sudo mv source-code-pro-1.017R/OTF/*.otf \
/usr/local/share/fonts/ && fc-cache -f -v && rm 1.017R.zip && rm -Rf \
source-code-pro-1.017R

# Japanese and Chinese input
sudo apt install -y ibus-anthy ibus-mozc ibus-libpinyin

# Remove software
sudo apt remove -y gnome-chess aisleriot gnome-klotski \
iagno tali gnome-sudoku gnome-mahjongg gnome-tetravex \
gnome-taquin swell-foop gnome-robots quadrapassel gnome-nibbles \
gnome-mines lightsoff hitori four-in-a-row five-or-more

# Software
sudo apt install -y gnome-tweaks rhythmbox rhythmbox-plugins \
simple-scan transmission-gtk gimp inkscape audacity kid3 gparted \
soundconverter libreoffice mpv kdenlive blender gnome-clocks \
keepassxc screenfetch neofetch geogebra gnome-boxes vim

# Custom GNOME shortcuts (vertical workspaces)
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left \
"['<Super>Page_Up', '<Control><Alt>Left', '<Control><Alt>h']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right \
"['<Super>Page_Down', '<Control><Alt>Right', '<Control><Alt>l']"

# Google Chrome
curl -fSsL https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor | sudo tee /usr/share/keyrings/google-chrome.gpg >> /dev/null
echo deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update
sudo apt install google-chrome-stable

# Skype
curl -sSL https://repo.skype.com/data/SKYPE-GPG-KEY | sudo gpg --dearmor -o /usr/share/keyrings/skype-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/skype-keyring.gpg] https://repo.skype.com/deb stable main" | sudo tee /etc/apt/sources.list.d/skype-stable.list
sudo apt update # If WARNING message: https://askubuntu.com/a/1409985
sudo apt install skypeforlinux

# Discord
sudo apt install wget gconf-service gconf2-common libc++1 libc++1-14 libc++abi1-14 libgconf-2-4 libunwind-14
wget "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb
sudo apt install ./discord.deb
rm ./discord.deb

# OBS Studio
sudo apt install obs-studio

# VS Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/microsoft-archive-keyring.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install code
rm ./microsoft.gpg

# Docker
sudo
apt install apt-transport-https ca-certificates \
curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor > /etc/apt/trusted.gpg.d/docker.gpg
echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -sc) stable" \
> /etc/apt/sources.list.d/docker-ce.list
apt update
apt install docker-ce docker-ce-cli docker-compose-plugin
exit
sudo usermod -aG docker lajto
sudo systemctl start docker
sudo systemctl enable docker

# Autoremove
sudo apt autoremove -y

# Telegram
wget -O telegram.tar.xz https://telegram.org/dl/desktop/linux
tar -xvf telegram.tar.xz
rm telegram.tar.xz
mv Telegram ~/.telegram-desktop-dir
~/.telegram-desktop-dir/Telegram # launchs Telegram

# Anki
sudo apt install libxcb-cursor0
wget -O anki.tar.zst https://github.com/ankitects/anki/releases/download/2.1.62/anki-2.1.62-linux-qt6.tar.zst
tar --use-compress-program=unzstd -xvf anki.tar.zst
rm anki.tar.zst
mv anki-* ~/.anki-hidden-dir
cd ~/.anki-hidden-dir/ && sudo ./install.sh && cd ~
# Uninstall: ./uninstall.sh

# Tuta Desktop
wget https://app.tuta.com/desktop/tutanota-desktop-linux.AppImage
mkdir -p ~/.tutanota-dir/
mv tutanota-desktop-linux.AppImage ~/.tutanota-dir/
chmod a+x ~/.tutanota-dir/tutanota-desktop-linux.AppImage
~/.tutanota-dir/tutanota-desktop-linux.AppImage # launchs Tutanota

# Flatpak
sudo apt install flatpak
sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Steam
sudo apt install libgtk2.0-0:i386
sudo apt install steam-installer
# AFTER: Run "Install Steam app"

# Wine
sudo apt install wine wine32 wine64 libwine libwine:i386 fonts-wine
sudo apt install winetricks
winetricks corefonts fontfix vcrun2005sp1 vcrun2008 vcrun6

# REBOOT