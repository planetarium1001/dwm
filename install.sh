#! /usr/bin/bash
echo "===Create a new folder for dwm in ~/.config/dwm"
mkdir ~/.config/dwm
mkdir ~/.config/dwm/config
mkdir ~/.config/dwm/statusbar
echo "===Copy files to ~/.config/dwm"
cp -r ./scripts/config/* ~/.config/dwm/config/
cp -r ./scripts/statusbar/* ~/.config/dwm/statusbar/
cp ./scripts/autostart.sh ~/.config/dwm/autostart.sh
echo "===Copy and install dwm"
sudo make clean install
echo "===Copy profile to ~/.xprofile & ~/.xinitrc"
cp ./scripts/xprofile ~/.xprofile
cp ./scripts/xinitrc ~/.xinitrc
echo "===Copy dwm.desktop to /usr/share/xsessions/dwm.desktop"
sudo cp ./dwm.desktop /usr/share/xsessions/dwm.desktop
echo "===Install finished"
