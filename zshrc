autoload -U colors && colors

eval $( dircolors -b $HOME/.ls_colors/LS_COLORS )

#{{{ Tab completion

autoload -Uz compinit && compinit

# color partial completions
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=0}:${(s.:.)LS_COLORS}")';

# add user scripts to path
PATH="${HOME}/.scripts:${PATH}:"

# add user binaries to path
PATH="${HOME}/.bin:${PATH}:"

# add sbin to PATH so sudo can tab complete it
PATH=":/sbin:/usr/sbin:${PATH}:"

# add path for quartus
PATH="/opt/altera/quartus/:/opt/altera/quartus/bin:${PATH}:"
PATH="/opt/altera/nios2eds/bin/gnu/H-i686-pc-linux-gnu/bin:${PATH}:"
PATH="/opt/altera/nios2eds/sdk2/bin/:${PATH}:"
PATH="/opt/altera/nios2eds/bin/:${PATH}:"
PATH="/opt/altera/nios2eds/:${PATH}:"

# path for modelsim
PATH="/mnt/drive_1/opt/modelsim_ase/bin/:${PATH}"

# add path for mplabx
PATH="microchip/mplabx/mplab_ide/bin/:${PATH}:"

# add path for xc16
PATH="/opt/microchip/xc16/v1.11/bin/:${PATH}:"

# android sdk
PATH="/opt/adt_bundle/sdk/platform-tools/:${PATH}:"
PATH="/opt/adt_bundle/sdk/tools/:${PATH}:"
PATH="/opt/adt_bundle/sdk/:${PATH}:"
#PATH="/opt/adt_bundle/eclipse/:${PATH}"

# android os
PATH="${HOME}/.android_os/apktool/:${PATH}:"
PATH="/opt/packages/dex2jar/:${PATH}:"

#export ANDROID_SWT="/usr/share/swt-3.7/lib"
#export ANDROID_HOME="/opt/adt_bundle/sdk/:${PATH}:"

#eagle
PATH="/opt/eagle-7.3.0/bin:${PATH}:"

# tab complete known hosts
hosts=(`sed 's/\[\|\]\| .*//g;s/,/\n/g;s/:.*$//g' ~/.ssh/known_hosts | sort | uniq | tr '\n' ' '`)
zstyle ':completion:*:hosts' hosts $hosts

# case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' '+l:|=* r:|=*'

# kill tab completion
zstyle ':completion:*:processes-names' command 'ps -e -o comm='
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;32'

#source scripts
source $HOME/.scripts/to
source $HOME/.scripts/up

CAD_ROOT="/usr/src/lib"

#add sbin to PATH so sudo can tab complete it
#PATH="/sbin/:/usr/sbin/:${PATH}"
#export PATH="/sbin/:/usr/sbin/:/usr/lib/distcc/bin:/home/user/scripts/:/opt/Xilinx/12.4/ISE_DS/ISE/bin/lin:${PATH}"
#export ROOTPATH="/opt/Xilinx/12.4/ISE_DS/ISE/bin/lin:${ROOTPATH}"
#export PYTHONSTARTUP="/home/user/.pythonrc"

#}}}

#{{{ Aliases

alias ssh_home='ssh samir@silbak04.gotdns.com -p 1337'
alias ssh_server='ssh pwner@durknation.gotdns.com -p 69'
alias ssh_media='ssh media@durknation.gotdns.com -p 337'
alias ssh_uc='ssh silbaksr@ucfilespace.uc.edu'
alias ssh_eng='ssh silbaksr@virtulab.ceas1.uc.edu'
alias media_proxy='ssh -D 1025 media@durknation.gotdns.com -p 337'
alias uc_proxy='ssh -D 1025 silbaksr@ucfilespace.uc.edu -p 22'

#alias mount_server='sshfs -p 69 -o TCPKeepAlive=yes pwner@durknation.gotdns.com:/mnt/ /home/user/Desktop/media'
alias mount_server='sshfs -p 69 -o reconnect -o follow_symlinks pwner@durknation.gotdns.com:/mnt/ /home/user/Desktop/media'
alias mount_eng='sshfs -o reconnect -o follow_symlinks silbaksr@virtulab.ceas1.uc.edu:/home/silbaksr/ /home/user/eng'

alias halt='systemctl poweroff'
alias cpv='rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress --'
alias ls='ls --group-directories-first --color=auto -X -h -v'
alias ll='ls -l'
alias la='ls -la'
alias lt='ls -lt'
alias grep='grep -i --color'
alias egrep='egrep --color'
alias df='df -h'
alias locate='locate -i'

# start mplayer in fullscreen mode
alias mplayer='mplayer -fs'

alias watch='watch --color'
#alias rsync='rsync -avz --stats --progress'
alias less='/usr/share/vim/vim73/macros/less.sh'

# redshift to dim screen respect to time of day
alias redshift='redshift -l 39.125231:-84.529038 -t 5500:3700 -g 0.8 -m vidmode -v'

alias lower='tr "[:upper:]" "[:lower:]"'
alias upper='tr "[:lower:]" "[:upper:]"'

# program fpga basys chip
alias fpga_prog='djtgcfg -d DOnbUsb prog -i 0 -f'

# program fpga basys2 chip
alias fpga_bprog='djtgcfg prog -d Basys2 -i 0 -f'

# magic layout
alias magic="magic -T/mnt/drive_1/school/vlsi/models/SCN3ME_SUBM.30.tech27"

#}}}

#{{{ Options

# don't cycle through completions
setopt BASH_AUTO_LIST
setopt NO_AUTO_MENU

# cd=pushd
setopt AUTO_PUSHD
setopt PUSHD_SILENT

# regex like globbing: cp ^*.(tar|bz2|gz)
setopt EXTENDED_GLOB

# don't beep
setopt NO_BEEP

# emacs keybindings
setopt EMACS

# disable ctrl-s (breaks rtorrent)
setopt NO_FLOW_CONTROL

# = is needed for emerge
unsetopt EQUALS

setopt vi

#}}}

#{{{ Key bindings

#autoload zkbd
#[[ ! -f ${ZDOTDIR:-$HOME}/.zkbd/$TERM-$VENDOR-$OSTYPE ]] && zkbd
#source ${ZDOTDIR:-$HOME}/.zkbd/$TERM-$VENDOR-$OSTYPE

# home / end keys (press <ctrl+v><_key_bind_you_want_>)
bindkey "^[OH" beginning-of-line
bindkey "^[OF" end-of-line
bindkey "^E" end-of-line
bindkey "^A" beginning-of-line
bindkey "^[[2~" quoted-insert
bindkey "^[[3~" delete-char
bindkey "^[[5~" beginning-of-history
bindkey "^[[6~" end-of-history

# vi bindkeys
bindkey -M viins 'jj' vi-cmd-mode
bindkey -M vicmd 'u' undo
bindkey -M viins '^R' history-incremental-search-backward
bindkey -M viins '^R' history-incremental-pattern-search-backward

# http://stackoverflow.com/questions/3622943/zsh-vi-mode-status-line
function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

#}}}

#{{{ History

HISTSIZE=10000000
SAVEHIST=10000000
# share history between users
HISTFILE=$HOME/.history

# write after each command
setopt INC_APPEND_HISTORY

# share history between multiple shells
setopt SHARE_HISTORY

setopt HIST_IGNORE_DUPS

# remove superfluous blanks
setopt HIST_REDUCE_BLANKS

# don't store if command begins with a space
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE

# don't execute a history expansion, just show it
#setopt HIST_VERIFY

# auto-correction
#setopt correctall

h() { if [ -z "$*" ]; then history 1; else history 1 | egrep "$@"; fi; }

#}}}

#{{{ VCS info in PS1

# http://briancarper.net/blog/570/git-info-in-your-zsh-prompt

# execute commands in PS1
setopt PROMPT_SUBST

autoload -Uz vcs_info

zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' formats '%F{yellow}(%b%c%u%F{yellow}) '

#}}}

#{{{ Terminal title

function title_job() {
    if [[ $TERM == 'screen'* ]]; then
        print -Pn "\ek${1//\\/\\\\}\e\\"
    else
        print -Pn "\e]0;${1//\\/\\\\}\a"
    fi
}


function title_path() {
    if [[ $TERM == 'screen'* ]]; then
        print -Pn "\ek%~\e\\"
    else
        print -Pn "\e]0;%n@%m: %~\a"
    fi
}

# set the intial title
title_path

#}}}

precmd() { vcs_info; title_path; }

preexec() { title_job $1; }

PROMPT='%B%(!.%F{red}.%F{green})%n@%m %B%F{blue}%~ ${vcs_info_msg_0_}%F{blue}%# %b%f%k'
