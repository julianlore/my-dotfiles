xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

# Fix an issue with Gnome keyring not starting because of a dbus issue by sourcing the following file
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Pass argument to xinitrc to choose de/wm, i3 as default
session=${1:-i3}
case $session in
  i3             ) exec i3;;
  cinnamon|c|cin ) exec cinnamon;;
  *              ) exec $1;;
esac
