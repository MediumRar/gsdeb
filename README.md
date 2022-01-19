# gsdeb

# THIS GUIDE IS NEITHER COMPLETE NOR PERFECT FOR SURE !!!

This repo is mainly for myself, but I thought to myself, why not share. So here you go.
This is my preferred linux daily driver. Everything from programming to gaming is not only possible,
but the best possible linux experience IMO. Enjoy stable Debian with a very lightweight "DE".

- Install Debian however you desire
- DO NOT install any DE obviously
- DO install the standard system utilities though
- Basically you wanna install a barebones debian OS

## GSDeb
### Install gsdeb
You will have to install git first:
```
sudo apt update && apt upgrade
sudp apt install git
```

Then clone the GIT-Repository:
```
git clone https://git.geilerschas.at/gsdeb.git ~/.
cd ~/gsdeb
```

Now you can make some configurations in the install script itself or via the various configuration files (dwm, dmenu, st etc.). You should check the install script in particular, to make sure, everything is installed for the correct user!
```
vi install.sh
```

As soon as you are done, install as root user.
```
cd ~/gsdeb
./install.sh
```

### Start gsdeb
As soon as you are logged in as the user you chose in the install script, you can start gsdeb by starting the xserver.
```
startx
```

### Autostart gsdeb
If you want to automatically start gsdeb whenever you login with your user,
add the following to your .bashrc file.

DO NOT DO THIS WITH YOUR ROOT USER!!! YOU ARE GONNA REGRET IT SOONER OR LATER!!!
```
echo "if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then\n    exec start\nfi" >> ~/.bashrc
```

## Controls
You can check and, of course alter, the src/dwm/config.h file for all available controls,
but following a brief summary of the most important shortcuts:
```
SUPER+1-9           -> Toggle between tags (workspaces)
SUPER+SHIFT+1-9     -> Assign window to tag (workspace)
SUPER+Up/Down       -> Toggle active window
SUPER+Return        -> Toggle main window

SUPER+b             -> Toggle menubar
SUPER+p             -> Open dmenu (Search for programms)

SUPER+SHIFT+Return  -> Open a terminal
SUPER+a             -> Control Audio
SUPER+w             -> Control WIFI

SUPER+F1            -> Toggle Mute
SUPER+F2            -> Lower Volume by 1%
SUPER+F3            -> Raise Volume by 1%
SUPER+F4            -> Play/Pause (Currently, only Spotify is supported)
SUPER+F5            -> Previous track (Currently, only Spotify is supported)
SUPER+F6            -> Next track (Currently, only Spotify is supported)
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
If you have an older graphics card you might want to install
https://packages.debian.org/bullseye/nvidia-detect
first to check for the proper graphics driver, otherwise just add "contrib non-free"
to all of your entries in the source.list and:
```
add-apt-repository non-free
dpkg --add-architecture i386
apt-get install firmware-misc-nonfree steam nvidia-driver
```

