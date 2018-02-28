# Oh-my-zsh stuff
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnosterzak"

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
# ENABLE_CORRECTION="true"

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
plugins=(git sudo dirhistory alias-tips archlinux)


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='emacs'
else
	export EDITOR='vim'
fi

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
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jl/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Aliases from bashrc and new ones
# To cd into my McGill folder
#alias mcg='cd /home/jl/Dropbox/McGill'

# append to path
path+=('/home/jl/Dropbox/bin')

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
alias s='xrandr --output eDP1 --off'
# Duplicate screens
#alias d='mons -d'
alias d='xrandr --output eDP1 --output HDMI1 --same-as eDP1'

# Rotations
alias rl='xrandr --output HDMI1 --rotate left'
alias rr='xrandr --output HDMI1 --rotate right'

# Cd in dropbox folder
alias cdrop='cd /home/jl/Dropbox'
# Repo folder
alias crepo='cd /home/jl/Dropbox/Repos'
# Power off quickly
alias off='systemctl poweroff'
# Reboot quickly
alias reboot='systemctl reboot'
# Push using git quickly to master
alias push='git push -u origin master'

# Update quickly
alias up='yaourt -Syua --noconfirm'

# Suspend
#alias h ='exec systemctl suspend && i3lock'

# To quickly edit configs
alias i3config='vim ~/.config/i3/config'
alias bashrc='vim ~/.bashrc'
alias zshrc='vim ~/.zshrc'
alias .emacs='emacs ~/.emacs'

# Google Drive using gdrivefs
alias gd='sudo gdfs -o allow_other /var/cache/gdfs.creds /mnt/gdrivefs'
alias ugd='sudo umount /mnt/gdrivefs'

alias ew='emacs -nw'
# Tungsten is a wolfram cli interpreter
alias wolf='tungsten'

# McGill vpn
alias mvpn='sudo openconnect "securevpn.mcgill.ca"'

# Import PGP key
alias pimp='gpg --recv-keys'

# Mount and unmount hard drive quickly
alias hdd='sudo mount /dev/sdb1 ~/Big\ Boi'
alias uhdd='sudo umount /dev/sdb1'

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

# # Access folders in pcmanfm quickly, opens a new tab
# alias CTF='pcmanfm "file:/home/jl/Dropbox/McGill/CTF"'
# alias ctf='pcmanfm "file:/home/jl/Dropbox/McGill/CTF"'
# alias repo='pcmanfm "file:/home/jl/Dropbox/Repos"'
# alias drop='pcmanfm "file:/home/jl/Dropbox"'
# alias down='pcmanfm "file:/home/jl/Downloads"'
# alias org='pcmanfm "file:/home/jl/Dropbox/1.Org"'
# alias mcg='pcmanfm "file:/home/jl/Dropbox/McGill"'
# alias text='pcmanfm "file:/home/jl/Dropbox/McGill/Textbooks"'
# alias sem='pcmanfm "file:/home/jl/Dropbox/McGill/Fall 2017"'
# alias c251='pcmanfm "file:/home/jl/Dropbox/McGill/Fall 2017/COMP 251 - Algorithms & Data Structures"'
# alias c230='pcmanfm "file:/home/jl/Dropbox/McGill/Fall 2017/COMP 230 - Logic and Computability"'
# alias c302='pcmanfm "file:/home/jl/Dropbox/McGill/Fall 2017/COMP 302"'
# alias c310='pcmanfm "file:/home/jl/Dropbox/McGill/Fall 2017/COMP 310"'
# alias c350='pcmanfm "file:/home/jl/Dropbox/McGill/Fall 2017/COMP 350 - Numerical Analysis"'
# alias text='pcmanfm "file:/home/jl/Dropbox/McGill/Textbooks"'
# alias goo='pcmanfm "file:/mnt/gdrivefs"'
# alias mcr='pcmanfm "file:/home/jl/Dropbox/Repos/McGill-Resources"'
# alias bin='pcmanfm "file:/home/jl/Dropbox/bin"'

# # Faster cd
# alias cc251='cd "/home/jl/Dropbox/McGill/Fall 2017/COMP 251 - Algorithms & Data Structures"'
# alias cc230='cd "/home/jl/Dropbox/McGill/Fall 2017/COMP 230 - Logic and Computability"'
# alias cc302='cd "/home/jl/Dropbox/McGill/Fall 2017/COMP 302"'
# alias cc310='cd "/home/jl/Dropbox/McGill/Fall 2017/COMP 310"'
# alias cc350='cd "/home/jl/Dropbox/McGill/Fall 2017/COMP 350 - Numerical Analysis"'
# alias cmcr='cd /home/jl/Dropbox/Repos/McGill-Resources'
# alias cbin='cd /home/jl/Dropbox/bin'
# alias cctf='cd /home/jl/Dropbox/McGill/CTF'

alias firefox='firefox-nightly'
alias cleanfox='firefox -private -safe-mode'

alias clean='sudo pacman -Sc'
# List network devices
alias net='ip link'
# Faster cd

alias CTF='cd "/home/jl/Dropbox/McGill/CTF"'
alias ctf='cd "/home/jl/Dropbox/McGill/CTF"'
alias repo='cd "/home/jl/Dropbox/Repos"'
alias drop='cd "/home/jl/Dropbox"'
alias down='cd "/home/jl/Downloads"'
alias org='cd "/home/jl/Dropbox/1.Org"'
alias mcg='cd "/home/jl/Dropbox/McGill"'
alias text='cd "/home/jl/Dropbox/McGill/Textbooks"'
alias sem='cd "/home/jl/Dropbox/McGill/Winter 2018"'
alias c251='cd "/home/jl/Dropbox/McGill/Fall 2017/COMP 251 - Algorithms & Data Structures"'
alias c230='cd "/home/jl/Dropbox/McGill/Fall 2017/COMP 230 - Logic and Computability"'
alias c302='cd "/home/jl/Dropbox/McGill/Fall 2017/COMP 302"'
alias c310='cd "/home/jl/Dropbox/McGill/Fall 2017/COMP 310"'
alias c350='cd "/home/jl/Dropbox/McGill/Fall 2017/COMP 350 - Numerical Analysis"'
alias c360='cd "/home/jl/Dropbox/McGill/Winter 2018/COMP 360 - Algorithm Design"'
alias c424='cd "/home/jl/Dropbox/McGill/Winter 2018/COMP 424 - Artificial Intelligence"'
alias c540='cd "/home/jl/Dropbox/McGill/Winter 2018/COMP 540 - Matrix Computations"'
alias m314='cd "/home/jl/Dropbox/McGill/Winter 2018/MATH 314 - Advanced Calculus"'
alias m324='cd "/home/jl/Dropbox/McGill/Winter 2018/MATH 324 - Statistics"'
alias text='cd "/home/jl/Dropbox/McGill/Textbooks"'
alias goo='cd "/mnt/gdrivefs"'
alias mcr='cd "/home/jl/Dropbox/Repos/McGill-Resources"'
alias bin='cd "/home/jl/Dropbox/bin"'
alias snip='cd "/home/jl/.emacs.d/snippets"'
alias crib='cd "/home/jl/Dropbox/Repos/crib-sheets"'
