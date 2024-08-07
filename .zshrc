# tmux plugin stuff
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOQUIT=false
# Oh-my-zsh stuff
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
ZSH=~/.oh-my-zsh/

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="pygmalion"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git sudo alias-tips archlinux zsh-autosuggestions extract tmux tmuxinator vi-mode web-search)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='nvim'
export VISUAL='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
ZSHRC_LOCAL="$HOME/.zshrc.local"
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# No longer using mons, using xrandr instead
# To use mons and extend 2nd monitor to right
#alias eright='mons -e right'
alias eright='xrandr --auto --output HDMI1 --primary --right-of eDP1'
alias eup='xrandr --auto --output HDMI1 --primary --above eDP1'
# 2nd monitor to left
#alias eleft='mons -e left'
alias eleft='xrandr --auto --output HDMI1 --primary --left-of eDP1'
# Only primary screen
#alias p='mons -o'
alias p='xrandr --output HDMI1 --off'
# Only secondary screen
#alias s='mons -s'
alias sc='xrandr --output eDP1 --off'
# Duplicate screens
#alias d='mons -d'
alias d='xrandr --output eDP1 --output HDMI1 --same-as eDP1'

# Rotations
alias rl='xrandr --output HDMI1 --rotate left'
alias rr='xrandr --output HDMI1 --rotate right'

# Power off quickly
alias off='systemctl poweroff'
# Reboot quickly
alias reboot='systemctl reboot'

# Suspend
#alias h ='exec systemctl suspend && i3lock'

alias ew='emacsclient -t'
alias e='emacsclient -c -a emacs'

alias nv='nvim'
alias v='nvim'

alias re='systemctl --user restart emacs'

# Temp scratchpad to write stuff
alias scratch='e ~/scratch.org'

# To quickly edit configs
alias i3config='$EDITOR ~/.config/i3/config'
alias zathurarc='$EDITOR ~/.config/zathura/zathurarc'
alias bashrc='$EDITOR ~/.bashrc'
alias zshrc='$EDITOR ~/.zshrc'
alias zshrc.local='$EDITOR $ZSHRC_LOCAL'
alias zshrclocal='$EDITOR $ZSHRC_LOCAL'
alias .emacs='e ~/.doom.d/config.el'
alias initel='e ~/.doom.d/init.el'
alias .emacs.local='e ~/.emacs.d/.emacs.local'
alias .emacslocal='e ~/.emacs.d/.emacs.local'
alias .emacs.d='cd ~/.doom.d'

# Tungsten is a wolfram cli interpreter
alias wolf='tungsten'

# Import PGP key
alias pimp='gpg --recv-keys'

# Other SSD partition
alias ssd='sudo mount /dev/sda3 ~/WSSD'
alias ussd='sudo umount /dev/sda3'

# List processes by top memory consumption
alias mem='ps aux --sort -rss'

# Update initramfs
alias mkinit='_ mkinitcpio -v -p linux'

# Valgrind memory leak checking
alias leak='valgrind --leak-check=full --show-leak-kinds=all'

alias ll='ls -l'
alias la='ls -a'

# colordiff close to git diff
alias gdiff='colordiff -u'

# bc to always use floating point numbers
alias bc='bc -l'

alias cleanfox='firefox -private -safe-mode'

alias clean='yay -Sc'
# List network devices
alias net='ip link'

# quick re-source
alias s='source ~/.zshrc'

# quick exit
alias x='exit'

alias st='startx ~/.xinitrc'
alias sn='nvidia-xrun'

# tmux aliases
alias tm='tmux attach-session -t'
alias tmls='tmux list-sessions'
alias tmk='tmux kill-session -t'

# History with Ctrl+R
bindkey -v
bindkey '^R' history-incremental-search-backward

# Show size of git repo
alias gdu='git count-objects -vH'

# Delete all merged branches that aren't master
alias grmb="git fetch -p && git branch --merged | grep -v '*\|master' | xargs git branch -d"

# Push, setting upstream to current branch
alias gpsu='git rev-parse --abbrev-ref HEAD | xargs git push --set-upstream origin'
alias gsuir='git submodule update --init --recursive'

# Makefile aliases
alias m='make'
# make with number of core parallel jobs
alias mj="m -j `nproc`"
alias mc='m -C'
alias mjc='mj -C'

# tar aliases
# Extract + decomp
alias tare='tar xvzf'
# Compress
alias tarc='tar cvzf'
# Max compression
alias tarcc='env GZIP=-9 tar cvzf'
alias tarcx='XZ_OPT=-e9 tar cvjf'

# Matlab
alias ml='matlab -nodesktop -nosplash'

# Docker aliases
alias dockerlsi='_ docker images -a --format "{{.Repository}}:{{.Tag}} {{.ID}}"'
alias dockerlsc='_ docker ps -a -q'
alias dc='docker-compose'

# Grep aliases
# Grep only specific file types
alias grephs='grep --include \*.hs'
alias grepc='grep --include \*.h --include \*.c'
alias grepcpp='grep --include \*.h --include \*.cpp'

# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
# Source home-manager if present
if [ -f "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" ]; then
    source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
    XDG_DATA_DIRS+=("$HOME/.nix-profile/share")
fi
# Aliases
alias xup='nix-channel --update && home-manager switch'
alias nsh='nix-shell'
alias ngc='nix-collect-garbage'
alias homenix='$EDITOR ~/.config/home-manager/home.nix'

# nnn cd on quit feature
# https://github.com/jarun/nnn/blob/master/misc/quitcd/quitcd.zsh
n ()
{
    # Block nesting of nnn in subshells
    if [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, export NNN_TMPFILE after the call to nnn
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
        . "$NNN_TMPFILE"
        rm -f "$NNN_TMPFILE" > /dev/null
    fi

}

alias vc='virt-manager'
if [ -f "$ZSHRC_LOCAL" ]; then
    source $ZSHRC_LOCAL
fi
