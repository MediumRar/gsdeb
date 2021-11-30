#!/bin/bash
echo "" > ./install.log
(
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
    bin_path="/usr/local/bin"
    # Config end

    if [ -z ${user_name+x} ]; then
        echo "user_name is not set!";
        exit 1
    fi

    # Dependencies:
    # dwm -> build-essential libx11-dev libxft-dev libxinerama-dev
    # sound -> firmware-linux pulseaudio
    # dbus (e.g. spotify) -> dbus-x11
    # WiFi -> network-manager
    # Compositor -> compton
    #
    echo
    echo "Installing dependencies ..."
    apt-get update && apt-get upgrade
    apt-get install build-essential libx11-dev libxft-dev libxinerama-dev firmware-linux pulseaudio dbus-x11 network-manager compton

    echo
    echo "Compiling suckless software ..."
    sudo make clean install --directory src/dmenu
    sudo make clean install --directory src/dwm
    sudo make clean install --directory src/st

    echo
    echo "Copying scripts ..."
    sudo cp --verbose bin/sd_media_ctrl ${bin_path}/.
    sudo cp --verbose bin/sd_wifi_ctrl  ${bin_path}/.

    echo
    echo "Copying configs ..."
    sudo cp --verbose cfg/compton.conf ${home_path}/.config/.

    echo
    echo "Copying dot-files ..."
    sudo cp --verbose dot/.bashrc  ${home_path}/.
    sudo cp --verbose dot/.vimrc   ${home_path}/.
    sudo cp --verbose dot/.xinitrc ${home_path}/.

    echo
    echo "Finished!"
) 2>&1 | tee -a install.log
