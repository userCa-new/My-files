#!/usr/bin/env bash 

set -e

# Update system
update_arch()
{
  sudo pacman -Syu
}

# Packages
install_packages()
{
   # Languages
   sudo pacman -S --noconfirm --needed jdk25-openjdk
   sudo pacman -S --noconfirm --needed python
   sudo pacman -S --noconfirm --needed python-pipx
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

   # Other
   sudo pacman -S --noconfirm --needed wget
   sudo pacman -S --noconfirm --needed fuse2
   sudo pacman -S --noconfirm --needed distrobox
   sudo pacman -S --noconfirm --needed 7zip
   pipx install tldr
}

# Flatpak 
install_flatpak()
{
  sudo pacman -S --noconfirm --needed flatpak 

  flatpak install flathub org.onlyoffice.desktopeditors -y 
  flatpak install flathub org.kde.kdenlive -y
  flatpak install flathub com.obsproject.Studio -y
  flatpak install flathub org.gimp.GIMP -y
  flatpak install flathub org.localsend.localsend_app -y
  flatpak install flathub com.super_productivity.SuperProductivity -y
  flatpak install flathub org.ferdium.Ferdium -y
  flatpak install flathub com.orama_interactive.Pixelorama -y
}

# Others softwares
install_other()
{
   sudo pacman -S --noconfirm --needed librewolf
   sudo pacman -S --noconfirm --needed mysql-workbench
   sudo pacman -S --noconfirm --needed zathura
   sudo pacman -S --noconfirm --needed zathura-pdf-mupdf
   sudo pacman -S --noconfirm --needed mpv
   
   curl -f https://zed.dev/install.sh | sh
   wget -c https://www.blender.org/download/release/Blender5.2/blender-5.2.2-linux-x64.tar.xz
   wget -c https://github.com/ankitects/anki/releases/download/26.09.3/anki-26.09.3-linux-x86_64.tar.zst
   wget -c https://edgedl.me.gvt1.com/android/studio/ide-zips/2026.1.4.8/android-studio-quail4-patch1-linux.tar.gz
  # wget -c https://dl.pstmn.io/download/latest/linux_64
   wget -c https://github.com/imputnet/helium-linux/releases/download/0.18.1.1/helium-0.18.1.1-x86_64.AppImage
   wget -c https://files.stirlingpdf.com/linux-installer.AppImage
   wget -c https://github.com/audacity/audacity/releases/download/Audacity-4.0.0/audacity-linux-4.0.0-x86_64.AppImage
  # wget -c https://sourceforge.net/projects/qbittorrent/files/latest/download
}

# Extra
extra_config()
{
  mkdir /home/$USER/Documents/AppImages
  mkdir /home/$USER/Documents/Books
  mkdir /home/$USER/Documents/Softwares
  mkdir /home/$USER/Documents/AppImages/Icons
  mkdir /home/$USER/Documents/Softwares/Icons
}

update_arch
install_packages
install_flatpak
install_other
extra_config

echo -e "Instalação concluída!"
