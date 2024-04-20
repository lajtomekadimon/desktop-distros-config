# LAST FEDORA VERSION TESTED: 38
# Desktop environment: GNOME

###############################################################################
#                                   BASICS                                    #
###############################################################################

sudo dnf install -y git make

sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf update -y
sudo dnf groupupdate -y core
sudo dnf groupupdate -y sound-and-video

# NVIDIA drivers
sudo dnf install -y akmod-nvidia
sudo dnf install -y xorg-x11-drv-nvidia-cuda
sudo dnf update -y
# REBOOT and choose Nvidia Xorg on login screen.

###############################################################################
#                                   SOFTWARE                                  #
###############################################################################

sudo dnf install -y rpmfusion-free-release-tainted
sudo dnf install -y libdvdcss
sudo dnf install -y kernel-headers kernel-devel libxml2 libxml2-devel
sudo dnf groupinstall -y "Development Tools"
sudo dnf groupinstall -y "Development Libraries"

# Terminal utils
sudo dnf install -y screenfetch neofetch tokei vim-enhanced

# Compression tools
sudo dnf install -y unrar p7zip p7zip-plugins zip unzip xz

# Codecs
sudo dnf install -y webp-pixbuf-loader # .webp files
sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel

# Fonts
sudo dnf install -y freetype-freeworld levien-inconsolata-fonts
sudo dnf install -y adobe-source-code-pro-fonts mozilla-fira-mono-fonts
sudo dnf install -y google-droid-sans-mono-fonts dejavu-sans-mono-fonts
sudo dnf install -y google-noto-sans-fonts
sudo dnf install -y http://sourceforge.net/projects/mscorefonts2/files/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm

# Japanese and Chinese input
sudo dnf install -y ibus-anthy ibus-libpinyin

# Android tools
sudo dnf install -y android-tools

# Common software
sudo dnf install -y gnome-clocks gnome-tweaks gnome-builder
sudo dnf install -y gparted simple-scan
sudo dnf install -y gimp inkscape audacity-freeworld kid3 blender
sudo dnf install -y mpv
sudo dnf install -y transmission-gtk
sudo dnf install -y keepassxc
sudo dnf install -y kdenlive kf5-kirigami2

# Tuta Desktop
wget https://app.tuta.com/desktop/tutanota-desktop-linux.AppImage
mkdir -p /home/$(USERNAME)/.tutanota-dir/
mv tutanota-desktop-linux.AppImage /home/$(USERNAME)/.tutanota-dir/
chmod a+x /home/$(USERNAME)/.tutanota-dir/tutanota-desktop-linux.AppImage
/home/$(USERNAME)/.tutanota-dir/tutanota-desktop-linux.AppImage # launchs Tutanota

# Telegram Desktop
wget -O telegram.tar.xz https://telegram.org/dl/desktop/linux
tar -xvf telegram.tar.xz
rm telegram.tar.xz
mv Telegram ~/.telegram-desktop-dir
~/.telegram-desktop-dir/Telegram # launchs Telegram

# Skype
sudo curl -o /etc/yum.repos.d/skype-stable.repo https://repo.skype.com/rpm/stable/skype-stable.repo
sudo dnf install -y skypeforlinux

# Discord
sudo dnf install -y discord
# Just in case: https://www.reddit.com/r/Fedora/comments/132xfy9/comment/ji7c0q4/?utm_source=reddit&utm_medium=web2x&context=3

# OBS Studio
sudo dnf install -y obs-studio

# VS Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install code

# DBeaver CE
sudo dnf install -y https://dbeaver.io/files/dbeaver-ce-latest-stable.x86_64.rpm

# Docker
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER
sudo systemctl start docker
sudo systemctl enable docker

# Anki
wget -O anki.tar.zst https://github.com/ankitects/anki/releases/download/2.1.62/anki-2.1.62-linux-qt6.tar.zst
tar --use-compress-program=unzstd -xvf anki.tar.zst
rm anki.tar.zst
mv anki-* ~/.anki-hidden-dir
cd ~/.anki-hidden-dir/ && sudo ./install.sh && cd ~
# Uninstall: ./uninstall.sh

# Google Chrome
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install -y google-chrome-stable

# Microsoft Edge
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/edge
sudo dnf install microsoft-edge-stable
