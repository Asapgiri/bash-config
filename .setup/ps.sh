#!/bin/bash

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
    path_fg=97      # white
    git_fg_arrow=31 # red
    git_fg=30       # black
    git_bg=41       # red
fi

# functions
slope_left() { echo -e "\\[\e[${system_bg};30m\\]\ue0b0"; }
#slope_left() { echo -e "\e[32m\ue0ba"; }
slope_path() { echo -e "\\[\e[100;${user_fg_path}m\\]\ue0bc\\[\e[${path_fg}m\\]"; }
slope_git() { echo -e "\e[100;${git_fg_arrow}m\ue0ba"; }
at() { echo -e "\e[${user_bg};${system_fg_user}m\ue0bc"; }
show_git_branch() {
    if [ ! -z "$(__git_ps1)" ]; then
        echo -e "$(slope_git)\e[${git_bg};${git_fg}m \uf418 $(__git_ps1 "%s") "
    fi
}
arrow() {
    if [ ! -z "$(__git_ps1)" ]; then
        echo -e "\e[49;${git_fg_arrow}m\ue0b0"
    else
        echo -e "\e[49;90m\ue0b0"
    fi
}

# NerdFont End ========================================================

if [ "$color_prompt" = yes ]; then
    source /usr/lib/git-core/git-sh-prompt
    PS1="\
$(slope_left)${debian_chroot:+($debian_chroot)} \
\h $(at)\
\\[\e[${user_bg};${user_fg}m\\] \u \
\\[$(slope_path)\\] \w \
\\[\$(show_git_branch)\\]\
\\[\$(arrow)\e[0m\\] "
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

