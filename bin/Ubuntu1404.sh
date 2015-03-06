#!/bin/bash

# Install my favorite programs in one fell swoop

# If a number is provided on the command line, the script only runs that 
# many iterations deep.j
DEPTH=$1

echo INSTALL BASIC COMMANDS
sudo apt-get -y install unison sshfs openssh-server aptitude vim-nox gdebi

echo UPGRADING and UPDATING...
sudo apt-get update
sudo aptitude -y upgrade
DEPTH=$(($DEPTH-1)); if [ $DEPTH -eq 0 ]; then exit 0; fi; echo $DEPTH

# Add the Ubuntu partner repository (if it doesn't exist).
echo Checking Partner Repositories...
if [ ! -f /etc/apt/sources.list.d/partner.list ]; then
	echo "deb http://archive.canonical.com/ubuntu $(lsb_release -cs) partner" > /etc/apt/sources.list.d/partner.list && sudo apt-get update
fi
DEPTH=$(($DEPTH-1)); if [ $DEPTH -eq 0 ]; then exit 0; fi; echo $DEPTH

# APPLICATION
editors="emacs23 emacs23-el exuberant-ctags vim vim-common vim-gnome vim-gui-common vim-runtime vim-latexsuite xclip"
general="aiksaurus antiword bibletime bibletime-data filezilla gnucash sysvbanner"
office="kontact"
web="bluefish evolution kdewebdev pidgin scribus thunderbird winefish xchat-gnome"
APPLICATION="$editors $general $office $web"
APPLICATION_DOC="gnucash-docs"
echo "--------------------"
echo APPLICATION
sudo apt-get -y install --  $APPLICATION
DEPTH=$(($DEPTH-1)); if [ $DEPTH -eq 0 ]; then exit 0; fi; echo $DEPTH

# TYPESCRIPT options
pdf="evince pdfcrack pdfjam pdftk xpdf"
postscript="enscript gv"
tex="auctex cm-super chktex latex-beamer latex-xcolor lilypond lilypond-doc prosper scribus scribus-template texlive texlive-doc-en texlive-generic-extra texlive-latex-base texlive-latex-recommended texlive-fonts-extra texlive-fonts-extra-doc texlive-pictures texlive-pictures-doc texlive-fonts-extra" # xft fontconfig
TYPESCRIPT="$fonts $pdf $postscript $tex"
echo "--------------------"
echo TYPESCRIPT
sudo apt-get -y install --  $TYPESCRIPT
DEPTH=$(($DEPTH-1)); if [ $DEPTH -eq 0 ]; then exit 0; fi; echo $DEPTH

# GRAPHICS
cad="librecad"
graphics="asymptote gimp barcode gnuplot inkscape kdegraphics imagemagick html2ps lilypond mkgmap pdf2svg xfig fig2ps openclipart-libreoffice openclipart2-libreoffice"
photo="f-spot"
GRAPHICS="$cad $clipart $graphics $photo"
GRAPHICS_DOC="asymptote-doc gimp-help-en gnuplot-doc lilypond-doc"
echo "--------------------"
echo GRAPHICS
sudo apt-get -y install --  $GRAPHICS $GRAPHICS_DOC
DEPTH=$(($DEPTH-1)); if [ $DEPTH -eq 0 ]; then exit 0; fi; echo $DEPTH

# AUDIO
audio_control="alsa-utils kmix"
audio_cd="abcde sound-juicer"
audio_player="amarok audacity banshee"
midi="playmidi pmidi timidity timidity-interfaces-extra"
audio_other="gtkpod gpodder skype"
AUDIO="$audio_control $audio_cd $audio_player $midi $audio_other"
echo "--------------------"
echo AUDIO
sudo apt-get -y install -- $AUDIO
DEPTH=$(($DEPTH-1)); if [ $DEPTH -eq 0 ]; then exit 0; fi; echo $DEPTH

# MULTIMEDIA
sound="lame sox csound denemo mpg123"
video="avidemux cheese dvdrip dvdbackup dvd95 faad vobcopy k3b kino mencoder miro mjpegtools mplayer mplayer-doc mplayer-fonts mplayer-skins smplayer vlc x264 xine-ui xmms2 ubuntu-restricted-extras"
MULTIMEDIA="$sound $video"
sudo apt-get -y install --  $MULTIMEDIA
DEPTH=$(($DEPTH-1)); if [ $DEPTH -eq 0 ]; then exit 0; fi; echo $DEPTH

# BROWSER
BROWSER="browser-plugin-vlc chromium-browser firefox flashplugin-installer xine-plugin icedtea-plugin"
echo "--------------------"
echo BROWSER
sudo apt-get -y install -- $BROWSER
DEPTH=$(($DEPTH-1)); if [ $DEPTH -eq 0 ]; then exit 0; fi; echo $DEPTH

# TRANSFER
TRANSFER="gftp amule azureus bittorrent transmission vuze"
echo "--------------------"
echo TRANSFER
sudo apt-get -y install -- $TRANSFER
DEPTH=$(($DEPTH-1)); if [ $DEPTH -eq 0 ]; then exit 0; fi; echo $DEPTH

# COMMAND_LINE
COMMAND_LINE="fdupes mc mmv sendemail tmux unison yum zsh"
echo "--------------------"
echo COMMAND_LINE
sudo apt-get -y install -- $COMMAND_LINE
DEPTH=$(($DEPTH-1)); if [ $DEPTH -eq 0 ]; then exit 0; fi; echo $DEPTH

# ADMIN
otherosfs="hfsutils hfsprogs iotop jfsutils lm-sensors mtpfs ntfs-config powertop synaptic xfsprogs"
POWER="acpi"
PRINTING="cups-bsd"
ADMIN="$otherosfs $POWER $PRINTING devscripts fail2ban fdupes gparted gddrescue iotop openssh-server powertop preload sshfs unetbootin xmacro"
echo "--------------------"
echo ADMIN
sudo apt-get -y install -- $ADMIN
DEPTH=$(($DEPTH-1)); if [ $DEPTH -eq 0 ]; then exit 0; fi; echo $DEPTH

SCAN="sane sane-utils tesseract-ocr-eng"
echo "--------------------"
echo SCAN
sudo apt-get -y install -- $SCAN
DEPTH=$(($DEPTH-1)); if [ $DEPTH -eq 0 ]; then exit 0; fi; echo $DEPTH

WIRELESS="linux-wlan-ng linux-wlan-ng-doc wavemon"
echo "--------------------"
echo WIRELESS
sudo apt-get -y install -- $WIRELESS
DEPTH=$(($DEPTH-1)); if [ $DEPTH -eq 0 ]; then exit 0; fi; echo $DEPTH

# PROGRAMMING
PYTHON="python-pip cython ipython pylint python-gmpy python-all-dev python-scientific python-scipy python-sympy python-zodb python-buzhug python-mpi4py-doc python-numpydoc"
PYTHON3="ipython3 python3 python3-all-dev python3-h5py python3-mpi4py python3-tk python3-numpy python3-scipy python3-notify2"
API="python-pygooglechart"
PROGRAMMING="$API $PYTHON $PYTHON3 eclipse git-core gitk graphviz kdiff3 kdeutils kompare libqt4-dev libgtk2.0-dev"
echo "--------------------"
echo PROGRAMMING
sudo apt-get -y install -- $PROGRAMMING
DEPTH=$(($DEPTH-1)); if [ $DEPTH -eq 0 ]; then exit 0; fi; echo $DEPTH

# DEVELOPMENT
## Find who installed postfix to deal with configs
DEVELOPMENT="alien auto-apt build-essential checkinstall debconf-utils debhelper debtags dh-make m4 mtools scons"
echo "--------------------"
echo DEVELOPMENT
sudo apt-get -y install -- $DEVELOPMENT
DEPTH=$(($DEPTH-1)); if [ $DEPTH -eq 0 ]; then exit 0; fi; echo $DEPTH

# ARCHIVE
ARCHIVE="arc archmage arj cabextract unrar dpkg-dev fakeroot ncompress ocaml p7zip-full zoo"
echo "--------------------"
echo ARCHIVE
sudo apt-get -y install -- $ARCHIVE
DEPTH=$(($DEPTH-1)); if [ $DEPTH -eq 0 ]; then exit 0; fi; echo $DEPTH

# WINDOWS
WINDOWS="wine virtualbox virtualbox-guest-additions-iso"
echo "--------------------"
echo WINDOWS
sudo apt-get -y install -- $WINDOWS
DEPTH=$(($DEPTH-1)); if [ $DEPTH -eq 0 ]; then exit 0; fi; echo $DEPTH

# ENTERTAINMENT
edutainment="childsplay childsplay-alphabet-sounds-en-gb gcompris gcompris-sound-en gnucap kstars tuxpaint tuxtype tuxtype-data"
games="angrydd armagetronad bsdgames bsdgames-nonfree cgoban crack-attack frozen-bubble gnome-games gnome-hearts gnugo klickety lbreakout2 lincity-ng mazeofgalious nethack-x11 nethack-console pingus pipenightdreams slashem slashem-gtk wesnoth wesnoth xboard"
games_opengl="fretsonfire neverball extremetuxracer supertuxkart"
missing="falconseye"
ENTERTAINMENT="$edutainment $games $games_opengl"
echo "--------------------"
echo ENTERTAINMENT
sudo apt-get -y install -- $ENTERTAINMENT
DEPTH=$(($DEPTH-1)); if [ $DEPTH -eq 0 ]; then exit 0; fi; echo $DEPTH

# Configuration
sudo chmod -x /etc/cron.daily/mlocate # Turn off updatedb.mlocate
# sudo chmod +x /etc/cron.daily/mlocate # Turn it back on

# Python Package manager (pip) from PyPI
sudo pip install flake8

