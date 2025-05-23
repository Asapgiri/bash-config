#!/bin/zsh

# NerdFont Start ======================================================
# colors
autoload -U colors && colors

system_bg=$bg[blue]
system_fg=$fg[white]
system_fg_user=$fg[blue]

if [ "$EUID" -ne 0 ]; then
    user_bg=$bg[green]
    user_fg=$fg[black]
    user_fg_path=$fg[green]
    path_fg=$fg[green]
    git_fg_arrow=$fg[yellow]
    git_fg=$fg[black]
    git_bg=$bg[yellow]
else
    user_bg=$bg[red]
    user_fg=$fg[black]
    user_fg_path=$fg[red]
    path_fg=$fg[red]
    git_fg_arrow=$fg[red]
    git_fg=$fg[black]
    git_bg=$bg[red]
fi
timestamp_color="\e[107;30m"

#component_separator="\ue0c7"
#component_separator=" "
component_separator=

# functions
slope_left() { echo -e "%{${system_fg_user}%}${left_separator}%{${user_bg}${user_fg}%} \$(date +'%H:%M:%S') "; }
slope_path() { echo -e "%{$fg[gray]%}${component_separator}%{$bg[gray]${path_fg}%}"; }
slope_git() { echo -e "%{$bg[gray]${git_fg_arrow}%}${component_separator}%{${git_bg}${git_fg}%} \uf418"; }
slope_time() { echo -e "${component_separator}"; }
at() { echo -e "%{${user_fg_path}%}${component_separator}"; }
#arrow() { echo -e "\\[\e[30m\\]${component_separator}"; }
arrow() { echo -e "${component_separator}"; }

calc_datetime() {
  time=${1}

  for limit in 604800 86400 3600 60; do
      echo -n $(echo "${time}/${limit}" | bc) ""
      time=$(echo "${time}%${limit}" | bc)
  done

  echo -n ${time}
}

# Set time counter
roundseconds() {
  IFS=' ' read -r -A ts <<< $(calc_datetime ${1})

  w=${ts[1]}
  d=${ts[2]}
  h=${ts[3]}
  m=${ts[4]}
  s=${ts[5]}

  #if   [[ $d -gt 0  ]] \
  #  || [[ $h -ge 6  ]]; then echo -ne "\e[40;97m"  # black  white
  #elif [[ $h -ge 2  ]]; then echo -ne "\e[100;97m" # gray   white
  #elif [[ $h -eq 1  ]]; then echo -ne "\e[41;97m"  # red    white
  #elif [[ $m -ge 45 ]]; then echo -ne "\e[43;30m"  # yellow black
  #elif [[ $m -ge 30 ]]; then echo -ne "\e[42;30m"  # green  black
  #elif [[ $m -ge 15 ]]; then echo -ne "\e[44;30m"  # blue   black
  #else                       echo -ne "" # white  black
  #fi

  echo -ne "%{$bg[white]$fg[black]%} "

  if [[ $w -gt 0 ]];  then echo -n "${w}w "; fi
  if [[ $d -gt 0 ]];  then echo -n "${d}d "; fi
  if [[ $h -gt 0 ]];  then echo -n "${h}h "; fi
  if [[ $m -gt 0 ]];  then echo -n "${m}m "; fi

  # rounds a number to 2 decimal places
  echo -ne $(echo s=$s";h=0.5;scale=4;t=1000;if(s<0) h=-0.5;a=s*t+h;scale=2;a/t;" | bc)s
  #echo -ne ${s}s
}

bash_getstarttime() {
  # places the epoch time in ns into shared memory
  gdate +%s.%N > "/var/tmp/${USER}.bashtime.${1}"
}

bash_getstoptime() {
  # reads stored epoch time and subtracts from current
  local endtime=$(gdate +%s.%N)
  local starttime=$(cat /var/tmp/${USER}.bashtime.${1})

  if  [[ "0" == "$starttime" ]]; then
    starttime=$endtime
    roundseconds 0
    exit 0
  fi

  roundseconds $(echo $(eval echo "$endtime - $starttime") | bc)

  echo 0 > /var/tmp/${USER}.bashtime.${1}
}

runonexit (){
  rm /var/tmp/${USER}.bashtime.${ROOTPID}
}

trap runonexit EXIT
ROOTPID=$$
bash_getstarttime $ROOTPID

# NerdFont End ========================================================

setopt PROMPT_SUBST
source ~/.config/zsh/git-prompt.sh

preexec() {
    bash_getstarttime $ROOTPID
}

PS1="\
$(slope_left)\
$(slope_path) %~ \
$(slope_git) \
\$(__git_ps1 \"%s \")\
$(slope_time)\
\$(bash_getstoptime $ROOTPID) \
$(arrow)%{$reset_color%} "

