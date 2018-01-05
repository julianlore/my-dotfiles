xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

# Fix an issue with Gnome keyring not starting because of a dbus issue by sourcing the following file
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Automatically start i3 on login to a tty
exec i3
