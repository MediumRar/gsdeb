# Set default volume of all audio devices
gs_audio_ctrl -v 50%

# Set Wallpaper
feh --no-fehbg --bg-scale /home/fips/.local/share/wallpaper &

# Start Compositor
compton &

# Show status (wifi | date | batterypercentage) in taskbar
gs_sys_status -w -d -b -p &

# Start DWM
exec dbus-launch --exit-with-session dwm
