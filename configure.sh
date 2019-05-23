#!/usr/bin/env bash
git submodule update --init --recursive
if [ -d /usr/share/zsh ] && [ -d /usr/share/oh-my-zsh ]
then
    sudo ln -s /usr/share/zsh/plugins/* /usr/share/oh-my-zsh/plugins
fi
git config --global core.excludesfile '~/.gitignore'
