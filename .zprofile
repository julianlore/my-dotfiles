# Change what manages qt theme
export QT_QPA_PLATFORMTHEME="qt5ct"
export TERMINAL="konsole"
export PATH=~/.npm-globa/bin:$PATH
# startx on login if there's a display
if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] 
then
#exec startx
fi
