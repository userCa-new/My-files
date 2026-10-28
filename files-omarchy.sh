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

  flatpak install flathub com.github.wwmm.easyeffects -y
  flatpak install flathub org.ferdium.Ferdium -y
  flatpak install flathub org.gimp.GIMP -y
  flatpak install flathub org.kde.kdenlive -y
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
   wget -c https://edgedl.me.gvt1.com/android/studio/ide-zips/2026.2.1.8/android-studio-rabbit1-linux.tar.gz
}

# Others softwares
install_other()
{
   sudo pacman -S --noconfirm --needed zathura
   sudo pacman -S --noconfirm --needed zathura-pdf-mupdf
   sudo pacman -S --noconfirm --needed proton-vpn-gtk-app
   
   wget -c https://github.com/ankitects/anki/releases/download/26.09.3/anki-26.09.3-linux-x86_64.tar.zst
   wget -c https://github.com/audacity/audacity/releases/download/Audacity-4.0.1/audacity-linux-4.0.1-x86_64.AppImage
   wget -c https://www.blender.org/download/release/Blender5.2/blender-5.2.3-linux-x64.tar.xz/
   wget -c https://dist.torproject.org/torbrowser/15.0.26/tor-browser-linux-x86_64-15.0.26.tar.xz
   # Postman, qBitorrent
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
