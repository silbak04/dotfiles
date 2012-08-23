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
PATH="${PATH}:/sbin:/usr/sbin:"

# tab complete known hosts
hosts=(`sed 's/\[\|\]\| .*//g;s/,/\n/g;s/:.*$//g' ~/.ssh/known_hosts | sort | uniq | tr '\n' ' '`)
zstyle ':completion:*:hosts' hosts $hosts

# case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# kill tab completion
zstyle ':completion:*:processes-names' command 'ps -e -o comm='
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;32'

#add sbin to PATH so sudo can tab complete it
#PATH="/sbin/:/usr/sbin/:${PATH}"
#export PATH="/sbin/:/usr/sbin/:/usr/lib/distcc/bin:/home/pwner/scripts/:/opt/Xilinx/12.4/ISE_DS/ISE/bin/lin:${PATH}"
#export ROOTPATH="/opt/Xilinx/12.4/ISE_DS/ISE/bin/lin:${ROOTPATH}"
#export PYTHONSTARTUP="/home/pwner/.pythonrc"
 

#}}}

#{{{ Aliases

alias ssh_home='ssh samir@silbak04.gotdns.com -p 1337'
alias ssh_server='ssh pwner@durknation.gotdns.com -p 69'
alias ssh_media='ssh media@durknation.gotdns.com -p 337'
alias ssh_uc='ssh silbaksr@ucfilespace.uc.edu'
alias ssh_eng='ssh silbaksr@virtulab.ceas1.uc.edu'
alias media_proxy='ssh -D 1025 media@durknation.gotdns.com -p 337' 

#alias mount_server='sshfs -p 69 -o TCPKeepAlive=yes pwner@durknation.gotdns.com:/mnt/ /home/pwner/Desktop/media'
alias mount_server='sshfs -p 69 -o reconnect -o follow_symlinks pwner@durknation.gotdns.com:/mnt/ /home/pwner/Desktop/media'

alias cpv='rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress --'
alias ls='ls --group-directories-first --color=auto -X -h'
alias ll='ls -l'
alias la='ls -la'
alias grep='grep --color'
alias egrep='egrep --color'
alias df='df -h'

# start mplayer in fullscreen mode
alias mplayer='mplayer -fs'

alias watch='watch --color'
alias rsync='rsync -avz --stats --progress'
alias less='/usr/share/vim/vim73/macros/less.sh'

# redshift to dim screen respect to time of day
alias redshift='redshift -l 39.125231:-84.529038 -t 5500:3700 -g 0.8 -m vidmode -v'

alias lower='tr "[:upper:]" "[:lower:]"'
alias upper='tr "[:lower:]" "[:upper:]"'

# program fpga basys chip
alias fpga_prog='djtgcfg -d DOnbUsb prog -i 0 -f'
# program fpga basys2 chip
alias fpga_bprog='djtgcfg prog -d Basys2 -i 0 -f'

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

#}}}

#{{{ Key bindings

#autoload zkbd
#[[ ! -f ${ZDOTDIR:-$HOME}/.zkbd/$TERM-$VENDOR-$OSTYPE ]] && zkbd
#source ${ZDOTDIR:-$HOME}/.zkbd/$TERM-$VENDOR-$OSTYPE

# use script to figure out special key bindings (i.e. homekey)
#[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
#[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
#[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
#[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
#[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
#[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
#[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
#[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
#[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
#[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
#[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char

# home / end keys
bindkey "^[OH" beginning-of-line
bindkey "^[OF" end-of-line
bindkey "^[[2~" quoted-insert
bindkey "^[[3~" delete-char
bindkey "^[[5~" beginning-of-history
bindkey "^[[6~" end-of-history

#}}}

#{{{ History

HISTSIZE=10000
SAVEHIST=10000
# share history between users 
HISTFILE=/home/pwner/.history

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
