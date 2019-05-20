#!/bin/bash

# =========== CONFIG =============
# Assuming we'll set the Google Drive folder to ~/GoogleDrive
#GOOGLE_DRIVE_FOLDER=$HOME/GoogleDrive
# ================================
# =========== CONFIG =============
# Assuming we'll set the Dropbox folder to ~/GoogleDrive
DROPBOX_FOLDER=$HOME/Dropbox
# ================================

# =========== ESSENTIAL ALIASES ==========
INSTALL='sudo apt install --yes'
UNINSTALL='sudo apt remove --yes'
IMPORTABLE_SETTINGS_FOLDER=$GOOGLE_DRIVE_FOLDER/Reference/Importable\ Software\ Settings
CURRENT_DIR=`pwd`
# ========================================


# ----- Prepare Package Manager -----

# For latest Git
sudo add-apt-repository --yes ppa:git-core/ppa

# For Oracle JDK
sudo add-apt-repository --yes ppa:linuxuprising/java

# For Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google.list

# For Gradle
#sudo add-apt-repository --yes ppa:cwchien/gradle

# For Ansible
#sudo add-apt-repository --yes ppa:ansible/ansible

# For Mono
#sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
#echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list

# For Double Commander
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 6CF401B78A9D7393F7F32E7510B3F6FDBE35DEDD
echo "deb http://ppa.launchpad.net/alexx2000/doublecmd/ubuntu xenial main" | sudo tee /etc/apt/sources.list.d/doublecmd-gtk.list

# For Sublime Text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# For Pinta
#sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 45EAD2AF3C2BB95F11E609A1BC3E0682A5A1D6B2
#echo "deb http://ppa.launchpad.net/pinta-maintainers/pinta-daily/ubuntu xenial main" | sudo tee /etc/apt/sources.list.d/pinta-daily.list

# For Insync
#wget -qO - https://d2t3ff60b2tol4.cloudfront.net/services@insynchq.com.gpg.key | sudo apt-key add -
#echo "deb http://apt.insynchq.com/mint tara non-free contrib" | sudo tee /etc/apt/sources.list.d/insync.list

# For PulseAudio Equalizer
sudo add-apt-repository --yes ppa:nilarimogard/webupd8

# For qBitTorrent
#sudo add-apt-repository --yes ppa:qbittorrent-team/qbittorrent-stable

# For VirtualBox
#wget -qO - https://www.virtualbox.org/download/oracle_vbox.asc | sudo apt-key add -
#wget -qO - https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo apt-key add -
#echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian bionic contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list

# For Vc Code
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

# For Papirus
sudo add-apt-repository ppa:papirus/papirus

# Done adding sources at this point.
$INSTALL apt-transport-https
sudo apt update
sudo apt-get upgrade


# ----- Browsers -----
$INSTALL google-chrome-stable

# ----- Install Insync (Google Drive client) to pull all importable settings -----
#$INSTALL insync
#echo
#echo "----- Now, please launch the Insync app and set it up. -----"
#echo "Assuming the Google Drive folder will be set to: $GOOGLE_DRIVE_FOLDER"
#echo
#read -p "Press [Enter] once Insync has finished syncing your files..."

$INSTALL nautilus-dropbox

# ----- Bash profile -----
#cp -Rf "$IMPORTABLE_SETTINGS_FOLDER/Linux/Mint/.bashrc" "$HOME"

# ----- Custom fonts -----
#USER_FONTS_FOLDER=$HOME/.fonts
#$INSTALL fontconfig

#if [ ! -d "$USER_FONTS_FOLDER" ]; then
#  mkdir "$USER_FONTS_FOLDER"
#fi

#rsync -av "$IMPORTABLE_SETTINGS_FOLDER/Fonts/Windows" "$USER_FONTS_FOLDER"
#rsync -av "$IMPORTABLE_SETTINGS_FOLDER/Fonts/Presentation" "$USER_FONTS_FOLDER"
#fc-cache -fv "$USER_FONTS_FOLDER"

# ----- Editors, protocol clients, terminal programs
$INSTALL curl wget axel httpie qbittorrent filezilla w3m mc terminator
$INSTALL gedit sublime-text code
$INSTALL remmina remmina-plugin-rdp
$INSTALL p7zip-full
$INSTALL tree ack-grep icu-devtools lnav dconf-tools

# ----- System Utils -----
$INSTALL hardinfo htop iftop mtr-tiny glances sysstat dstat ncdu gparted xclip

# Wireshark
$INSTALL wireshark
sudo groupadd wireshark
sudo usermod -a -G wireshark `whoami`
sudo chgrp wireshark /usr/bin/dumpcap
sudo chmod 750 /usr/bin/dumpcap
sudo setcap cap_net_raw,cap_net_admin=eip /usr/bin/dumpcap
sudo getcap /usr/bin/dumpcap

# ----- Gnome configs -----
#rsync -av "$IMPORTABLE_SETTINGS_FOLDER/Linux/Mint/.config/initial/" "$HOME/.config/initial/"
#dconf load /org/cinnamon/            < ~/.config/initial/org-cinnamon.dconf
#dconf load /org/gnome/gedit/         < ~/.config/initial/org-gnome-gedit.dconf
#dconf load /org/gnome/meld/          < ~/.config/initial/org-gnome-meld.dconf
#dconf load /org/gnome/terminal/      < ~/.config/initial/org-gnome-terminal.dconf
#dconf load /org/nemo/                < ~/.config/initial/org-nemo.dconf

# ----- SSH config -----
#rsync -av "$IMPORTABLE_SETTINGS_FOLDER/SSH/" "$HOME/.ssh/"

# ----- Double Commander + Settings -----
#$INSTALL doublecmd-gtk
#rsync -av "$IMPORTABLE_SETTINGS_FOLDER/Linux/Mint/.config/doublecmd/" "$HOME/.config/doublecmd/"

# ----- Development Tools -----
# Python
$INSTALL python python3 idle idle3 pypy python-pip python3-pip python-dev python3-dev pypy-dev

# JDK
$INSTALL oracle-java11-installer
$INSTALL oracle-java11-set-default
echo 'JAVA_HOME=/usr/lib/jvm/java-11-oracle' | sudo tee -a /etc/environment

# Mono
#$INSTALL mono-devel mono-complete

$INSTALL git subversion kdiff3 gitg meld cloc awscli
#$INSTALL ruby ruby-dev php
#$INSTALL maven
$INSTALL g++ clang gfortran cmake
$INSTALL apparmor
#$INSTALL jq
#$INSTALL monodevelop

# Node.js
$UNINSTALL node
curl --silent --location https://deb.nodesource.com/setup_10.x | sudo bash -
$INSTALL nodejs

# R
#$INSTALL r-base r-base-dev

# RStudio
#$INSTALL libjpeg62
#wget https://download1.rstudio.org/rstudio-xenial-1.1.463-amd64.deb
#sudo dpkg -i rstudio*.deb
#rm rstudio*.deb
#rsync -av "$IMPORTABLE_SETTINGS_FOLDER/RStudio/" "$HOME/.rstudio-desktop/"

# Gradle
#$INSTALL gradle
#echo 'GRADLE_HOME=/usr/lib/gradle/default' | sudo tee -a /etc/environment

# Ansible
#$INSTALL ansible

# Ruby gems
#sudo gem install bropages

# Docker
#wget -qO- https://get.docker.com/ | sh
#sudo usermod -aG docker `whoami`

#Papirus
$INSTALL papirus-icon-theme

# Other settings
#rsync -av "$IMPORTABLE_SETTINGS_FOLDER/Linux/Mint/" "$HOME/"

# ----- JetBrains IDEs -----
# Get the direct link here: https://www.jetbrains.com/idea/download/download-thanks.html?platform=linux
#IDEA_PACKAGE=https://download.jetbrains.com/idea/ideaIU-2018.3.2.tar.gz
#PYCHARM_PACKAGE=https://download.jetbrains.com/python/pycharm-professional-2018.3.2.tar.gz

#wget https://gist.githubusercontent.com/YuriyGuts/a88d522333ec5770f2775bbc98ef6c6c/raw/bd1919e9d0b03023e4267fa7c4f2ee3843ceb461/linux-install-jetbrains-product.sh
#bash linux-install-jetbrains-product.sh idea $IDEA_PACKAGE
#bash linux-install-jetbrains-product.sh pycharm $PYCHARM_PACKAGE

# ----- Anaconda -----
ANACONDA_PACKAGE=Anaconda3-2018.12-Linux-x86_64.sh

cd /tmp
ANACONDA_HOME=$HOME/anaconda3
wget https://repo.anaconda.com/archive/$ANACONDA_PACKAGE
bash $ANACONDA_PACKAGE -b -p $ANACONDA_HOME

cd $CURRENT_DIR
export PATH=$ANACONDA_HOME/bin:$PATH
conda install -y virtualenv joblib numpy nltk scikit-learn jupyter ipykernel matplotlib pyqt libgcc

# IPython and Jupyter
ipython profile create
jupyter notebook --generate-config

#rsync -IPavz "$IMPORTABLE_SETTINGS_FOLDER/IPython/profile_default/" ~/.ipython/profile_default/
#rsync -IPavz "$IMPORTABLE_SETTINGS_FOLDER/Jupyter/jupyter_notebook_config.py" ~/.jupyter/


# ----- Logitech Performance MX Mouse -----
$INSTALL xbindkeys xautomation
xbindkeys --defaults > "$HOME/.xbindkeysrc"

echo '
# Logitech Performance MX: map ZOOM button to middle click
"xte '\'mouseclick 2\''"
  b:13+release
' >> "$HOME/.xbindkeysrc"

pkill -f xbindkeys
xbindkeys


# ----- Redshift + Settings -----
#$INSTALL redshift redshift-gtk
#cp -Rf "$IMPORTABLE_SETTINGS_FOLDER/Linux/Mint/.config/redshift.conf" "$HOME/.config/redshift.conf"


# ----- SSH Server -----
#$INSTALL openssh-server
#sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.factory-defaults
#sudo chmod a-w /etc/ssh/sshd_config.factory-defaults
# sudo gedit /etc/ssh/sshd_config


# ----- VPN -----
#$INSTALL network-manager-openvpn network-manager-openvpn-gnome
#$INSTALL l2tp-ipsec-vpn


# ----- Virtualization ------
#$INSTALL dosbox
$INSTALL dkms build-essential linux-headers-`uname -r`
#$INSTALL virtualbox-6.0


# ----- Multimedia & Misc Utils -----
#$INSTALL pinta
#$INSTALL keepass2
#$INSTALL xfburn
$INSTALL rhythmbox vlc smplayer inkscape gthumb handbrake audacity mkvtoolnix mkvtoolnix-gui spotify-client
#$INSTALL steam

# VeraCrypt
#wget https://launchpad.net/veracrypt/trunk/1.23/+download/veracrypt-1.23-setup.tar.bz2
#tar xjvf veracrypt-1.23-setup.tar.bz2
#bash veracrypt-1.23-setup-gui-x64
#rm -f veracrypt*


# =========== Finalization ============
# Update DB for 'locate'
sudo updatedb


# =========== POST-STEPS ============
# When Chrome is installed, a new source is added automatically which causes a duplicate apt entry.
# We'll remove the one we added manually.
sudo rm -f /etc/apt/sources.list.d/google.list

sudo apt update
cd "$CURRENT_DIR"
# ===================================



# =========== MANUAL STEPS ============
# ----- System Clock -----
# Set RTC to local time (useful for Windows + Linux multiboot systems)
# sudo timedatectl set-local-rtc 1 --adjust-system-clock

# ----- SSD -----
# sudo gedit /etc/fstab
# # add "noatime" option to all non-swap partitions

# ----- Swap usage -----
# sudo gedit /etc/sysctl.conf
# # Decrease swap usage to a more reasonable level
# vm.swappiness=5

# Set account picture
# Set Login window
# Customize fonts in Google Chrome (Monospace -> Consolas)
# Customize panel appearance and applets (Bluetooth, Network, Date/Time, etc.)
# Power settings: hibernation, sleep, screensaver, locking window
# Customize Firefox: search engine, bookmarks 
