#!/usr/bin/env bash

# ls aliases
alias ll='ls -lF'
alias la='ls -lA'
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
