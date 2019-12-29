# If not running interactively, don't do anything
[[ $- != *i* ]] && return



# Aliases

alias ls='ls --color=always'
alias mm='rm config.h && make && sudo make clean install'
alias lowpow='source $HOME/Documents/scripts/battery/battery_saver.sh'
alias dot='git --git-dir=$HOME/.dots/ --work-tree=$HOME'
alias gp="git add . && git commit -m 'auto-commit' && git push origin master"
alias venv='source $HOME/.virtualenvs/env/bin/activate'
alias won='sudo $HOME/Documents/scripts/wifi/./scan'
alias woff='sudo $HOME/Documents/scripts/wifi/./plane-mode'
alias shut='systemctl poweroff'
alias v='nvim'
alias n='nvim $HOME/.config/nvim/init.vim'
alias r=lfcd 




# Keybindings

bind '"\er":"lfcd\C-m"'




# Variables

export EDITOR='nvim' 
export VISUAL='less'
export OPENER='xdg-open'


export VIRTUAL_ENV_DISABLE_PROMPT=1



# Functions

lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}



virtualenv_info(){
    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        venv="${VIRTUAL_ENV##*/}"
        echo $venv ''
    else
        # In case you don't have one activated
        venv=''
        echo $venv
    fi
}




# Colors
# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

export color00="28/28/28" # Base 00 - Black
export color01="fb/49/34" # Base 08 - Red
export color02="b8/bb/26" # Base 0B - Green
export color03="fa/bd/2f" # Base 0A - Yellow
export color04="83/a5/98" # Base 0D - Blue
export color05="d3/86/9b" # Base 0E - Magenta
export color06="8e/c0/7c" # Base 0C - Cyan
export color07="d5/c4/a1" # Base 05 - White
export color08="66/5c/54" # Base 03 - Bright Black
export color09=$color01 # Base 08 - Bright Red
export color10=$color02 # Base 0B - Bright Green
export color11=$color03 # Base 0A - Bright Yellow
export color12=$color04 # Base 0D - Bright Blue
export color13=$color05 # Base 0E - Bright Magenta
export color14=$color06 # Base 0C - Bright Cyan
export color15="fb/f1/c7" # Base 07 - Bright White
export color16="fe/80/19" # Base 09
export color17="d6/5d/0e" # Base 0F
export color18="3c/38/36" # Base 01
export color19="50/49/45" # Base 02
export color20="bd/ae/93" # Base 04
export color21="eb/db/b2" # Base 06
export color_foreground="d5/c4/a1" # Base 05
export color_background="28/28/28" # Base 00


put_template() { printf '\033]4;%d;rgb:%s\033\\' $@; }
put_template_var() { printf '\033]%d;rgb:%s\033\\' $@; }
put_template_custom() { printf '\033]%s%s\033\\' $@; }

# 16 color space
put_template 0  $color00
put_template 1  $color01
put_template 2  $color02
put_template 3  $color03
put_template 4  $color04
put_template 5  $color05
put_template 6  $color06
put_template 7  $color07
put_template 8  $color08
put_template 9  $color09
put_template 10 $color10
put_template 11 $color11
put_template 12 $color12
put_template 13 $color21
put_template 14 $color14
put_template 15 $color15

# 256 color space
put_template 16 $color16
put_template 17 $color17
put_template 18 $color18
put_template 19 $color19
put_template 20 $color20
put_template 21 $color21




# Sourced files

# source $HOME/Packs/nest-simulator/install_dict/bin/nest_vars.sh

VENV="$(virtualenv_info)" # Maybe the color is better on 1
# PS1='\n\[\033[01;38;5;142m\]\W \[\033[0m\]\n\[\033[38;5;211m\]$(virtualenv_info)\[\033[38;5;166m\]❯\[\033[0m\] '

PS1='\n\[\033[01;38;5;66m\]\W \[\033[0m\]\n\[\033[38;5;211m\]$(virtualenv_info)\[\033[38;5;166m\]❯\[\033[0m\] '
