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
   sudo pacman -S --noconfirm --needed wget
   sudo pacman -S --noconfirm --needed jdk25-openjdk
   sudo pacman -S --noconfirm --needed python
   sudo pacman -S --noconfirm --needed fuse2
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}

# Flatpak 
install_flatpak()
{
sudo pacman -S flatpak 

  flatpak install flathub org.onlyoffice.desktopeditors -y 
  flatpak install flathub com.super_productivity.SuperProductivity -y
  flatpak install flathub com.orama_interactive.Pixelorama -y
  flatpak install flathub org.localsend.localsend_app -y
  flatpak install flathub org.kde.kdenlive -y
  flatpak install flathub com.obsproject.Studio -y
  flatpak install flathub org.ferdium.Ferdium -y
  flatpak install flathub org.gimp.GIMP -y
}
# Others softwares
install_other()
{
   sudo pacman -S --noconfirm --needed librewolf
   sudo pacman -S --noconfirm --needed mysql-workbench
   sudo pacman -S --noconfirm --needed zathura
   sudo pacman -S --noconfirm --needed zathura-pdf-mupdf
   curl -f https://zed.dev/install.sh | sh
   wget -c https://www.blender.org/download/release/Blender5.2/blender-5.2.2-linux-x64.tar.xz
   wget -c https://github.com/ankitects/anki/releases/download/26.09.3/anki-26.09.3-linux-x86_64.tar.zst
   wget -c https://edgedl.me.gvt1.com/android/studio/ide-zips/2026.1.4.8/android-studio-quail4-patch1-linux.tar.gz
   wget -c https://dl.pstmn.io/download/latest/linux_64
   wget -c https://files.stirlingpdf.com/linux-installer.AppImage
}

# Database 
database_config()
{
 sudo pacman -Syu --noconfirm --needed httpd mariadb php php-apache
 

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
database_config
extra_config

echo -e "Instalação concluída!"
