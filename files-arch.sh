#!/usr/bin/env bash 

set -e

# Update system
update_arch()
{
  sudo pacman -Syu
}

# Packages
install_SystemPackages()
{
   # Languages
   sudo pacman -S --noconfirm --needed jdk25-openjdk
   sudo pacman -S --noconfirm --needed php
   sudo pacman -S --noconfirm --needed python
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.8/install.sh | bash
   

   # Utils
   sudo pacman -S --noconfirm --needed wget
   sudo pacman -S --noconfirm --needed fuse2
   sudo pacman -S --noconfirm --needed distrobox
   sudo pacman -S --noconfirm --needed python-pipx
   sudo pacman -S --noconfirm --needed 7zip
   sudo pacman -S --noconfirm --needed networkmanager
   sudo pacman -S --noconfirm --needed gnome-keyring
}

# Flatpak 
install_flatpak()
{
  sudo pacman -S --noconfirm --needed flatpak 

  flatpak install flathub com.bilingify.readest -y
  flatpak install flathub com.github.wwmm.easyeffects -y
  flatpak install flathub org.ferdium.Ferdium -y
  flatpak install flathub org.gimp.GIMP -y
  flatpak install flathub org.kde.kdenlive -y
  flatpak install flathub org.localsend.localsend_app -y
  flatpak install flathub com.obsproject.Studio -y
  flatpak install flathub org.onlyoffice.desktopeditors -y 
  flatpak install flathub com.orama_interactive.Pixelorama -y
  flatpak install flathub com.super_productivity.SuperProductivity -y
}

work_station()
{
   flatpak install flathub app.zen_browser.zen -y
   sudo pacman -S --noconfirm --needed mysql-workbench
   curl -f https://zed.dev/install.sh | sh
   wget -c https://edgedl.me.gvt1.com/android/studio/ide-zips/2026.1.4.8/android-studio-quail4-patch1-linux.tar.gz
}

# Others softwares
install_other()
{
   sudo pacman -S --noconfirm --needed zathura
   sudo pacman -S --noconfirm --needed zathura-pdf-mupdf
   sudo pacman -S --noconfirm --needed mpv
   sudo pacman -S --noconfirm --needed proton-vpn-gtk-app
   
   wget -c https://github.com/ankitects/anki/releases/download/26.09.3/anki-26.09.3-linux-x86_64.tar.zst
   wget -c https://github.com/audacity/audacity/releases/download/Audacity-4.0.1/audacity-linux-4.0.1-x86_64.AppImage
   wget -c https://www.blender.org/download/release/Blender5.2/blender-5.2.2-linux-x64.tar.xz
   wget -c https://github.com/imputnet/helium-linux/releases/download/0.19.4.1/helium-0.19.4.1-x86_64.AppImage
   wget -c https://downloads.sourceforge.net/project/qbittorrent/qbittorrent-appimage/qbittorrent-5.2.4/qbittorrent-5.2.4_x86_64.AppImage?ts=gAAAAABq1QodGe21RvUr4yOGexyiTlPQmnOb12RrH8svLEIx0ARg-SxmsYZP-IE4B7Y8ySWWodFEFYK15t7YcqYtaK7a5AdJ_g%3D%3D&r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fqbittorrent%2Ffiles%2Flatest%2Fdownload
   wget -c https://dist.torproject.org/torbrowser/15.0.25/tor-browser-linux-x86_64-15.0.25.tar.xz
}

# Extra
extra_folders()
{
  mkdir /home/$USER/Documents/AppImages
  mkdir /home/$USER/Documents/Books
  mkdir /home/$USER/Documents/Softwares
  mkdir /home/$USER/Documents/AppImages/Icons
  mkdir /home/$USER/Documents/Softwares/Icons
  mkdir /home/$USER/Workspace
}

update_arch
install_SystemPackages
install_flatpak
work_station
install_other
extra_folders

echo -e "Instalação concluída!"
