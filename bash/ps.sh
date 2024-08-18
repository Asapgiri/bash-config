#!/bin/bash

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-kitty|xterm-color|*-256color) color_prompt=yes;;
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

# NerdFont Start ======================================================
# colors
system_bg=44        # blue
system_fg=97        # white
system_fg_user=34   # blue

if [ "$EUID" -ne 0 ]; then
    user_bg=42      # green
    user_fg=30      # black
    user_fg_path=32 # green
    path_fg=32      # green
    git_fg_arrow=33 # yellow
    git_fg=30       # black
    git_bg=43       # yellow
else
    user_bg=41      # red
    user_fg=30      # black
    user_fg_path=31 # red
    path_fg=97      # red
    git_fg_arrow=31 # red
    git_fg=30       # black
    git_bg=41       # red
fi
timestamp_color="\e[107;30m"

#component_separator="\ue0c7"
#component_separator=""
component_separator=

# functions
slope_left() { echo -e "\\[\e[${system_fg_user}m\\]${left_separator}\\[\e[${user_bg};${user_fg}m\\] "; }
slope_path() { echo -e "\\[\e[90m\\]${component_separator}\\[\e[100;${path_fg}m\\]"; }
slope_git() { echo -e "\\[\e[100;${git_fg_arrow}m\\]${component_separator}\\[\e[${git_bg};${git_fg}m\\] \uf418"; }
slope_time() { echo -e "\\[\e[39m\\]${component_separator}"; }
at() { echo -e "\\[\e[${user_fg_path}m\\]${component_separator}"; }
#arrow() { echo -e "\\[\e[30m\\]${component_separator}"; }
arrow() { echo -e "${component_separator}"; }

function calc_datetime() {
  time=${1}

  for limit in 604800 86400 3600 60; do
      echo -n $(echo "${time}/${limit}" | bc) ""
      time=$(echo "${time}%${limit}" | bc)
  done

  echo -n ${time}
}

# Set time counter
function roundseconds() {
  IFS=' ' read -r -a ts <<< $(calc_datetime ${1})

  w=${ts[0]}
  d=${ts[1]}
  h=${ts[2]}
  m=${ts[3]}
  s=${ts[4]}

  if   [[ $d -gt 0  ]] \
    || [[ $h -ge 6  ]]; then echo -ne "\e[40;97m"  # black  white
  elif [[ $h -ge 2  ]]; then echo -ne "\e[100;97m" # gray   white
  elif [[ $h -eq 1  ]]; then echo -ne "\e[41;97m"  # red    white
  elif [[ $m -ge 45 ]]; then echo -ne "\e[43;30m"  # yellow black
  elif [[ $m -ge 30 ]]; then echo -ne "\e[42;30m"  # green  black
  elif [[ $m -ge 15 ]]; then echo -ne "\e[44;30m"  # blue   black
  else                       echo -ne "\e[107;30m" # white  black
  fi

  echo -ne " "

  if [[ $w -gt 0 ]];  then echo -n "${w}w "; fi
  if [[ $d -gt 0 ]];  then echo -n "${d}d "; fi
  if [[ $h -gt 0 ]];  then echo -n "${h}h "; fi
  if [[ $m -gt 0 ]];  then echo -n "${m}m "; fi

  # rounds a number to 2 decimal places
  echo -ne $(echo s=$s";h=0.5;scale=4;t=1000;if(s<0) h=-0.5;a=s*t+h;scale=2;a/t;" | bc)s
}

function bash_getstarttime() {
  # places the epoch time in ns into shared memory
  date +%s.%N > "/dev/shm/${USER}.bashtime.${1}"
}

function bash_getstoptime() {
  # reads stored epoch time and subtracts from current
  local endtime=$(date +%s.%N)
  local starttime=$(cat /dev/shm/${USER}.bashtime.${1})

  if  [ "0" == "$starttime" ]; then
    starttime=$endtime
    roundseconds 0
    exit 0
  fi

  roundseconds $(echo $(eval echo "$endtime - $starttime") | bc)

  echo 0 > /dev/shm/${USER}.bashtime.${1}
}

function runonexit (){
  rm /dev/shm/${USER}.bashtime.${ROOTPID}
}

trap runonexit EXIT
ROOTPID=$BASHPID
bash_getstarttime $ROOTPID

# NerdFont End ========================================================

if [ "$color_prompt" = yes ]; then
    source /usr/lib/git-core/git-sh-prompt
    PS0="\$(bash_getstarttime $ROOTPID)"
    PS1="\
\${debian_chroot:+(\$debian_chroot)}\
$(slope_left)\
$(slope_path) \w \
\$(__git_ps1 \"$(slope_git) %s \")\
$(slope_time)\$(bash_getstoptime $ROOTPID) \
$(arrow)\\[\e[0m\\] "
#    PS1="\
#\${debian_chroot:+(\$debian_chroot)}\
#$(slope_left) \h $(at)\
#\\[\e[${user_bg};${user_fg}m\\] \u \
#$(slope_path) \w \
#\$(__git_ps1 \"$(slope_git) %s \")\
#$(slope_time) \$(bash_getstoptime $ROOTPID)s \
#$(arrow)\\[\e[0m\\] "
else
    PS1='${debian_chroot:+($debian_chroot)}\w>\$ '
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

