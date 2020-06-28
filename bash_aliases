#!/usr/bin/env bash

# ls aliases
alias ll='ls -lFh'
alias la='ls -lAh'
alias l='ls -CF'

# Cheatcode to avoid typo
alias cd..='cd ..'

# Change directory shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
alias .6='cd ../../../../../..'
alias .7='cd ../../../../../../..'

# Color grep output
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Enable aliases to be sudo'ed
alias sudo='sudo '

# Fast clear
alias c='clear'

# Date
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

# Humanly readable df
alias df='df -H'
alias du='du -ch'
alias diskspace_report="df -P -kHl"
alias free_diskspace_report="diskspace_report"

# Search in history. This can be done with Ctrl+R as well.
alias hg='history | grep'

# Quick edit hosts file
alias hosts='sudo $EDITOR /etc/hosts'

# dig IP
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'

