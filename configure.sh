#!/usr/bin/env bash
git submodule update --init --recursive
git config --global core.excludesfile '~/.gitignore'

copymisc () {
    # Make backup dirs in Misc if they don't exist
    dirname $1 | sed -e "s/Misc\//Misc\/Backups\//" | xargs mkdir -p
    # Remove Misc from path, make it absolute path from /
    realpath=$(echo $1 | sed -e "s/Misc//")
    # If the file exists and no backup exists, copy it into backup folder
    if [ -f $realpath ]
    then
        backup=$(echo $1 | sed -e "s/Misc\//Misc\/Backups\//")
        if [ ! -f $backup ]
        then
            cp $realpath $backup
        fi
    fi
    # Copy Misc file to the absolute path
    sudo cp $1 $realpath
}
# Export the shell function so it's visible and can be called from a bash shell as we will execute bash using find
export -f copymisc
mkdir -p Misc/Backups
echo "Backing up misc existing files to Misc/Backups"
find Misc -mindepth 2 -type f ! -name "Backups*" -exec bash -c 'copymisc "$0"' {} \;
sudo grub-mkconfig -o /boot/grub/grub.cfg

copyhome () {
    dirname $1 | sed -e "s/\\.\//Backups\//" | xargs mkdir -p
    backup=$(echo $1 | sed -e "s/\\.\//Backups\//")
    # Escape / for sed
    eschome=$(echo $HOME | sed -e "s/\//\\\\\//g")
    realpath=$(echo $1 | sed -e "s/\\.\//$eschome\//")
    if [ -f $realpath ]
    then
        backup=$(echo $1 | sed -e "s/\.\//Backups\//")
        if [ ! -f $backup ]
        then
            cp $realpath $backup
        fi
    fi
    abspath=$(realpath $1)
    ln -sf $abspath $realpath
}
export -f copyhome

mkdir -p Backups
echo "Backing up home existing files to Backups"
# Copy files at maximum depth 1
find . -maxdepth 1 -type f ! \( -name ".gitignore" -o -name "*.md" -o -name "*.sh" -o -name "*.txt" -o -name "*~*" \) -exec bash -c 'copyhome "$0"' {} \;
# Otherwise, copy directories
find . -maxdepth 1 -type d ! \( -name "Misc" -o -name "Backups" \) -exec bash -c 'copyhome "$0"' {} \;
