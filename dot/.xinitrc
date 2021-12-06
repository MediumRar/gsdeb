# Set default volume of all audio devices
sd_set_volume 50%

# Set Wallpaper
feh --no-fehbg --bg-scale /home/fips/.local/share/wallpaper &

# Start Compositor
compton &

# Start DWM
exec dbus-launch --exit-with-session dwm
