# sucklessdebian

# THIS GUIDE IS NEITHER COMPLETE NOR PERFECT FOR SURE !!!

This repo is mainly for myself, but I thought to myself, why not share. So here you go. This is my preferred linux daily driver. Everything from programming to gaming is not only possible but the best possible linux experience IMO.
Enjoy stable Debian with a very lightweight "DE".

- Install Debian however you desire
- DO NOT install any DE obviously
- DO install the standard system utilities though
- Basically you wanna install a barebones debian OS

## SucklessDebian
### Install suckless software
Do the following as the user you plan to use for the "DE"
```
git clone https://github.com/erjeytetatetagey/sucklessdebian ~/.
cd ~/sucklessdebian
```
You can now make some configurations in the install script itself or via the suckless configuration files.
```
vi install.sh
```
As soon as you are done, install.
```
cd ~/sucklessdebian
./install.sh
```

### Autostart X
If you want to automatically start SucklessDebian whenever you login with your user, add the following to your .bashrc file.

DO NOT DO THIS WITH YOUR ROOT USER!!! YOU ARE GONNA REGRET IT SOONER OR LATER!!!
```
echo "if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then\n    exec start\nfi" >> ~/.bashrc
```

### Audio
To properly set your default soundcard see:
https://askubuntu.com/questions/71863/how-to-change-pulseaudio-sink-with-pacmd-set-default-sink-during-playback
Usually this works pretty well automatically, you might have to restart your system though.

## Controls
You can check and, of course alter, the src/dwm/config.h file for all available controls, but following a brief summary of the most important shortcuts:
```
SUPER+b            -> Toggle menubar
SUPER+1-4          -> Toggle between tags (workspaces)
SUPER+SHIFT+1-4    -> Assign window to tag (workspace)
SUPER+Up/Down      -> Toggle active window
SUPER+p            -> Open dmenu (Search for programms)
SUPER+SHIFT+Return -> Open a terminal
SUPER+w            -> Connect to WIFI
SUPER+F2           -> Lower Volume by 1%
SUPER+F3           -> Raise Volume by 1%
```
## Optional
### Development (Ecplise)
```
apt install build-essential gdb default-jdk
```
- Download pkg from https://www.eclipse.org/downloads/packages/
- Then unpack with "tar -xzf eclipse[...]x86_64.tar.gz -C /opt"

### Gaming (Steam)
#### AMD Graphics
Add "contrib non-free" to all of your entries in the source.list and then:
```
add-apt-repository non-free
dpkg --add-architecture i386
apt-get install firmware-misc-nonfree steam
```

#### NVIDIA Graphics
If you have an older graphics card you might want to install https://packages.debian.org/bullseye/nvidia-detect first to check for the proper graphics driver, otherwise just add "contrib non-free" to all of your entries in the source.list and:
```
add-apt-repository non-free
dpkg --add-architecture i386
apt-get install firmware-misc-nonfree steam nvidia-driver
```

