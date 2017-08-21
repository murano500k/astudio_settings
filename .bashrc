# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export PATH="/home/artem/bin:$PATH"
export PATH="/home/artem/bin/astudio/bin:$PATH"
export PATH="/home/artem/bin/sdk/tools:$PATH"
export PATH="/home/artem/bin/sdk/platform-tools:$PATH"
export PATH="/home/artem/bin/sdk/build-tools/26.0.1:$PATH"
export PATH="/home/artem/bin/sdk/ndk-bundle:$PATH"
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
export ANDROID_HOME="/home/artem/bin/sdk"
export PATH=$JAVA_HOME:$PATH
export PATH=$ANDROID_HOME:$PATH
export USE_CCACHE=0
export CCACHE_DIR=/media/artem/hddgl/.ccache
#alias gm='lastres=$?; notify-send --urgency=low -i "$([ $lastres = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'; echo $lastres | mailx -s "ubuntu mail $(date)"'
alias sendmail='lastres=$?; echo $lastres | mailx -s "flash finished $(date)"'
alias alert='res=$? && notify-send --urgency=low -i "$([ $res = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
export GRADLE_USER_HOME=/home/artem/.gradle
export PATH=$PATH:/home/artem/renesas/automation/scripts
export PATH=$PATH:/home/artem/bin/pycharm/bin
alias uapk='adb shell pm uninstall'
export PATH="/home/artem/renesas/cts/scripts:$PATH"
export PATH="/home/artem/renesas/multidev:$PATH"
export JENKINS_USER="artem.radchenko@globallogic.com"
export JENKINS_TOKEN="50b54d8fcb18c3c365445d4b46c0cebc"
alias minicom0="minicom -D /dev/ttyUSB0"
alias minicom1="minicom -D /dev/ttyUSB1"
alias minicom2="minicom -D /dev/ttyUSB2"
alias minicom3="minicom -D /dev/ttyUSB3"
alias chtty="ls /dev/ttyUSB*"
export iphp="172.22.89.23"
export ipje="172.22.89.21"
export ipqa="172.22.89.57"
alias syncold="chmod -R 775 /home/artem/renesas/salvatorauto/scripts ; sshpass  -p 'jenkins86' rsync -rv /home/artem/renesas/salvatorauto/scripts jenkins@$ipje:/home/jenkins/workspace/workspace/renesas-qa"
#alias sync="sshpass -p '\' rsync -rv artem@172.22.89.45:/home/artem/projects/renesas-qa/ /home/jenkins/workspace/workspace/renesas-qa/scripts"
alias sync="sshpass  -p 'jenkins86' rsync -rv /home/artem/projects/renesas-qa jenkins@$ipje:/home/jenkins/workspace/workspace/renesas-qa/scripts"
alias sj="sshpass  -p 'jenkins86' ssh jenkins@$ipje"
alias sh="sshpass  -p '\' ssh user@$iphp"
alias sshhome="sshpass  -p '\' ssh artem@murano500k.ddns.net"
alias sudo='sudo env PATH=$PATH'
alias relay0='sudo phidget-lite-x86_64 -r1 -s0'
alias relay1='sudo phidget-lite-x86_64 -r1 -s1'
alias relay='phidget.sh'
alias akill='adb kill-server'
alias acon='adb connect $ip'
alias adis='adb disconnect'
alias atest='adb shell ls'
alias areboot='timeout 2 adb reboot'
alias astart='adb start-server'
alias adev='adb devices'
alias ashell='adb shell'
alias munlock="sudo rm -rf /var/lock/LCK..ttyUSB*"
export ANDROID_NDK_PATH="/home/artem/bin/ndk"

export SCRIPTS_DIR=/home/artem/projects/renesas-qa
export PATH=$SCRIPTS_DIR:$PATH
export BUILD_DIR=/tmp/build
export LOG_DIR=/home/artem/projects/renesas-qa/logs
#PS1='\e[1m[\t]\[\e[34m\]\w$(if [[ $? == 0 ]]; then echo "\[\e[32m\]\$"; else echo "\[\e[31m\]\$"; fi)\[\e[0m\]'
export PATH="/home/artem/.linuxbrew/bin:$PATH"
alias pcat="pidcat.py"
alias pcatc="pidcat.py --current"
export VPN_GL_HOSTNAME="vpn-kbp.globallogic.com"
alias vpngl="sudo openconnect $VPN_GL_HOSTNAME"
export PATH=$HOME/bin/idea/bin:$PATH
export hddgl=/media/artem/hddgl
export TF=$hddgl/tf/tf_files
export MEDIA_DIR=/media/artem
export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4g"
export JACK_SERVER_VM_ARGUMENTS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4096m"
export PATH=$PATH:/home/artem/bin/clion/bin
export ANDROID_NDK=/home/artem/bin/android-ndk-r13b-linux-x86_64
export ANDROID_NDK_PATH=$ANDROID_NDK
export ANDROID_NDK_HOST_OS=linux-x86_64

alias pidcatpixel="pidcat.py -s FA6AW0300340 --current"
alias ar="adb root; adb remount"
export STUDIO64_VM_OPTIONS=/home/artem/bin/settings-astudio/studio64.vmoptions
export STUDIO_VM_OPTIONS=/home/artem/bin/settings-astudio/studio.vmoptions
export STUDIO_PROPERTIES=/home/artem/bin/settings-astudio/idea.properties
export homedomain="murano5090k.ddns.net"
alias sshpi="sshpass  -p 'qwerty' ssh pi@murano500k.ddns.net"
export piip="172.22.89.15"
alias syncrpi="rsync -rvl /home/artem/projects/ProjectRpi/ pi@$piip:/home/pi/ProjectRpi"
alias sshpi='sshpass -p "A128500z" ssh pi@192.168.0.7'
export PATH=$PATH:~/bin/idea-IC-172.3757.52/bin