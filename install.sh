#!/bin/bash
echo "Prepare ..."

# We need sudo priviliges if script is not run as root user.
if [[ "$EUID" != 0 ]]; then
    sudo -k
    if sudo false; then
        echo "This script needs sudo priviliges!"
        exit 1
    fi
fi


# Config start
user_name=$(ls /home | grep -vE "(\.|\..|lost\+found)")
home_path="/home/${user_name}"
wallpaper_path="${home_path}/.local/share/wallpaper.jpg"
bin_path="/usr/local/bin"
default_volume=50%

if [ -z ${user_name+x} ]; then
    echo "user_name is not set!";
    exit 1
fi
# Config end


if [ ! -d "~/.local" ]; then
    mkdir ~/.local
fi
if [ ! -d "~/.local/share" ]; then
    mkdir ~/.local/share
fi


# Dependencies:
# dwm -> build-essential libx11-dev libxft-dev libxinerama-dev
# sound -> firmware-linux pulseaudio
# dbus (e.g. spotify) -> dbus-x11
# WiFi -> network-manager
#
echo
echo "Installing dependencies ..."
apt-get update && apt-get upgrade
apt-get install build-essential libx11-dev libxft-dev libxinerama-dev firmware-linux pulseaudio dbus-x11 network-manager


echo
echo "Compiling suckless software ..."

sudo make clean install --directory src/dmenu
sudo make clean install --directory src/dwm
sudo make clean install --directory src/st


echo
echo "Copying custom scripts ..."
sudo cp --verbose src/bin/* ${bin_path}/.


echo
echo "Autoconfig for .xinitrc ..."
cat > ${home_path}/.xinitrc << EOFXINITRC
# Set default volume of all audio devices
sd_set_volume $default_volume

# Set Wallpaper
feh --bg-scale $wallpaper_path &

# Start DWM
exec dbus-launch --exit-with-session dwm
EOFXINITRC


echo
echo "Finished!"

