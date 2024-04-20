loadkeys euro
timedatectl

fdisk /dev/nvme0n1
### GPT (create if not)
# /mnt/boot (EFI system) 10GiB
# [SWAP] (Linux swap) 64GB
# /mnt (Linux root (x86-64)) 400GB
# _ () 500GB

mkfs.ext4 /dev/nvme0n1p3
mkfs.ext4 /dev/nvme0n1p4
mkswap /dev/nvme0n1p2
mkfs.fat -F 32 /dev/nvme0n1p1

mount /dev/nvme0n1p3 /mnt
mount --mkdir /dev/nvme0n1p1 /mnt/boot
swapon /dev/nvme0n1p2

pacstrap -K /mnt base base-devel linux linux-firmware efibootmgr nano vim grub os-prober networkmanager
# LAPTOP
#pacstrap -K /mnt base base-devel linux linux-firmware efibootmgr nano vim grub os-prober networkmanager netctl wpa_supplicant dialog xf86-input-synaptics

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt

ln -sf /usr/share/zoneinfo/UTC /etc/localtime
hwclock --systohc

nano /etc/locale.gen  # en_US.UTF-8 UTF-8
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=euro" >> /etc/vconsole.conf

echo "lajto-arch" >> /etc/hostname
nano /etc/hosts
# 127.0.0.1   localhost
# ::1         localhost
# 127.0.1.1   lajto-arch.localdomain lajto-arch

passwd

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
nano /etc/default/grub  # uncommment GRUB_DISABLE_OS_PROBER=false
grub-mkconfig -o /boot/grub/grub.cfg

useradd -m -g users -G audio,lp,optical,storage,video,wheel,games,power,scanner -s /bin/bash lajto
passwd lajto
sudo pacman -S vim
visudo  # %wheel ALL=(ALL) ALL

exit

umount -R /mnt

reboot

###################################################

# Note: Problems with keys? Run: sudo pacman-key --refresh-keys

sudo systemctl start NetworkManager
sudo systemctl enable NetworkManager

sudo nano /etc/pacman.conf  # [multilib]
sudo pacman -Syu

sudo pacman -S git

sudo pacman -S linux-headers wget zip unzip unrar p7zip

sudo pacman -S intel-ucode
sudo grub-mkconfig -o /boot/grub/grub.cfg

sudo pacman -S sway swaylock swayidle swaybg waybar foot fuzzel polkit
# Before starting sway it is advisable to either install them or set a new launcher and terminal in the configuration

cp tiling-wm-config/.gtkrc-2.0 ~/.gtkrc-2.0
mkdir -f ~/.config/gtk-3.0
cp tiling-wm-config/.config/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini
mkdir -f ~/.config/sway
cp tiling-wm-config/.config/sway/config ~/.config/sway/config
mkdir -f ~/.config/waybar
cp tiling-wm-config/.config/waybar/config ~/.config/waybar/config
cp tiling-wm-config/.config/waybar/style.css ~/.config/waybar/style.css

nmcli device wifi list  # check name
nmcli device wifi connect DEVICE_NAME password DEVICE_PASSWORD

sudo pacman -S pipewire lib32-pipewire

sudo pacman -S screenfetch neofetch glances ranger feh mupdf cloc tokei

sudo pacman -S noto-fonts noto-fonts-cjk \
adobe-source-code-pro-fonts adobe-source-sans-pro-fonts \
adobe-source-serif-pro-fonts ttf-dejavu \
ttf-junicode ttf-liberation ttf-linux-libertine ttf-roboto \
ttf-ubuntu-font-family ttf-indic-otf wqy-zenhei wqy-microhei \
wqy-microhei-lite cantarell-fonts otf-font-awesome ttf-font-awesome

sudo pacman -S xdg-user-dirs-gtk
xdg-user-dirs-update

sudo pacman -S firefox transmission-gtk gimp inkscape mpv kid3-qt \
libreoffice-still audacity xfburn gparted thunar eom atril engrampa pluma \
keepassxc font-manager mate-calc

sudo pacman -S gvfs gvfs-afc gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb

sudo pacman -S ntfs-3g android-file-transfer mtpfs

sudo pacman -S code
echo "--enable-features=WaylandWindowDecorations" > ~/.config/code-flags.conf
echo "--ozone-platform-hint=auto" >> ~/.config/code-flags.conf

sudo pacman -S docker docker-compose
sudo systemctl enable docker.service
sudo systemctl start docker.service

sudo pacman -S discord

sudo pacman -S chromium

echo "--enable-features=WaylandWindowDecorations" > ~/.config/electron25-flags.conf
echo "--ozone-platform-hint=auto" >> ~/.config/electron25-flags.conf

# Tuta Desktop
wget https://app.tuta.com/desktop/tutanota-desktop-linux.AppImage
mkdir -p ~/.tutanota-dir/
mv tutanota-desktop-linux.AppImage ~/.tutanota-dir/
chmod a+x ~/.tutanota-dir/tutanota-desktop-linux.AppImage
~/.tutanota-dir/tutanota-desktop-linux.AppImage # launches Tutanota

# Telegram Desktop
wget -O telegram.tar.xz https://telegram.org/dl/desktop/linux
tar -xvf telegram.tar.xz
rm telegram.tar.xz
mv Telegram ~/.telegram-desktop-dir
~/.telegram-desktop-dir/Telegram # launches Telegram

# TODO: Japanese and Chinese keyboard support
# https://bbs.archlinux.org/viewtopic.php?id=268359
pkg install textproc/ibus japanese/ibus-mozc chinese/ibus-libpinyin

# TODO: Screenshots

# TODO: Volume and other sound managements

# TODO: Screen resolution

# TODO: Write Spanish and other special characters

# TODO: General improvements
# https://wiki.archlinux.org/title/System_time
# https://wiki.archlinux.org/title/General_recommendations
# https://wiki.archlinux.org/title/System_maintenance
# https://arewewaylandyet.com/
