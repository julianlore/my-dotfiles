#!/usr/bin/env bash
# git submodule update --init --recursive
# if [ -d /usr/share/zsh ] && [ -d /usr/share/oh-my-zsh ]
# then
#     sudo ln -s /usr/share/zsh/plugins/* /usr/share/oh-my-zsh/plugins
# fi
# git config --global core.excludesfile '~/.gitignore'

copymisc () {
    dirname $1 | sed -e "s/Misc\//Misc\/Backups\//" | xargs mkdir -p
    realpath=$(echo $1 | sed -e "s/Misc//")
    if [ -f $realpath ]
    then
        backup=$(echo $1 | sed -e "s/Misc\//Misc\/Backups\//")
        if [ ! -f $backup ]
        then
            cp $realpath
        fi
    fi
    sudo cp $1 $realpath
}
export -f copymisc
mkdir -p Misc/Backups
echo "Backing up existing files to Misc/Backups"
find Misc -mindepth 2 -type f ! -name "Backups*" -exec bash -c 'copymisc "$0"' {} \;
sudo grub-mkconfig -o /boot/grub/grub.cfg
