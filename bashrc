# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

export TERM=xterm-256color

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
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


export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] '


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto -lvh'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

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
source ~/.fzf.bash

export BOOST_LIBRARYDIR=/usr/local/lib/
export BOOST_INCLUDEDIR=/usr/include
export FZF_DEFAULT_OPTS="--sort 20000"
EDITOR=/usr/local/bin/gvim
export EDITOR=/usr/local/bin/gvim

eval "$(grunt --completion=bash)"

#TODO
#1.przejscie do katalogu newMT
#2. budowanie knife
#3. budowanie mt
#4. przebudowanie mt

alias kastrator='perl ~/dotfiles/vim_scripts/kastrator_flexi.pl'
alias ks='perl ~/dotfiles/vim_scripts/kastrator_flexi.pl'
alias rhapsody='/opt/rhapsody/linux/ix86/rhapsody_7.5.2.1/Rhapsody'
alias rhapsodyDiff='/opt/rhapsody/linux/ix86/rhapsody_7.5.2.1/diffmerge.exe'

alias tern='tern --persistent --verbose'





## a quick way to get out of current directory ##
#alias .='cd ..'
alias ..='cd ../..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

## Colorize the ls output ##
alias ls='ls --color=auto'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias apt-get='sudo apt-get'

alias mtsrc='source C_Application/SC_OAM/CMake/set-env-custom'
alias mtprep2old='cd C_Application/SC_OAM;source CMake/set-env-custom;./configure FCMD --output-dir=../out-rel2 --add-tests; cd ../out-rel2;make edit_cache'¬
alias mtprep3old='cd C_Application/SC_OAM;source CMake/set-env-custom;./configure FCT --output-dir=../out-rel3 --add-tests; cd ../out-rel3;make edit_cache'¬
alias mtprep2='cd C_Application/SC_OAM;source CMake/set-env-custom;./configure FCMD --output-dir=../out-rel2 --add-tests=UTMT; cd ../out-rel2;make edit_cache'¬
alias mtprep3='cd C_Application/SC_OAM;source CMake/set-env-custom;./configure FCT --output-dir=../out-rel3 --add-tests=UTMT; cd ../out-rel3;make edit_cache'¬
#alias mtprep2='cd C_Application/SC_OAM;source CMake/set-env-custom;./configure FCMD --output-dir=../out-rel2 --skip-asn-generation --add-tests; cd ../out-rel2;make edit_cache'
#alias mtprep3='cd C_Application/SC_OAM;source CMake/set-env-custom;./configure FCT --output-dir=../out-rel3 --skip-asn-generation --add-tests; cd ../out-rel3;make edit_cache'
alias mtgen='make generate_rhapsody_all -j 3'
alias mtcom='make BBC_BasebandBusConfiguration_Test -j 4 -l 2'
alias mtsetenv='source C_Application/SC_OAM/CMake/set-env-custom'
alias mtcd='cd C_Test/SC_OAM/BBC_BasebandBusConfiguration/WTF/app/exe'
alias mtrun='./BBC_BasebandBusConfiguration_Test --spawn --detect_memory_leaks=0'
#alias mtrun='./BBC_BasebandBusConfiguration_Test --spawn --detect_memory_leaks=0'
alias mtclean='make clean_rhapsody_all'
alias mtredo='mtclean;mtgen;mtcom'
alias mtredoBBC='make clean_rhapsody_BBC_BasebandBusConfiguration;mtgen;mtcom'

alias status="svn status | grep '^A\|^M\|C_Application.*h$\|C_Application.*cpp$\|txt$\|C_Application.*cls$\|C_Application.*sbs$\|C_Test.*h$\|C_Test.*cpp$'"
alias statusfinal="svn status | grep '^A\|^M\|C_Application.*h$\|C_Application.*cpp$\|txt$\|C_Application.*cls$\|C_Application.*sbs$\|C_Test.*h$\|C_Test.*cpp$' | grep -v '^?'"

# update on one command 
alias update='sudo apt-get update && sudo apt-get upgrade'

#for tab to complete matches
bind '"\t":menu-complete'

NPM_PACKAGES="${HOME}/npm-packages"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
PATH="$NPM_PACKAGES/bin:$PATH"
unset MANPATH
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

export PATH=${HOME}/bin:$PATH

