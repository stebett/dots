# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.git-prompt.sh

# Temporary functions
alias tesi="source $HOME/.virtualenvs/tesi/bin/activate && cd ~/Thesis/"
alias sal='export TERM=xterm-256color && ssh ginkobab@salvatore -t tmux a'

# Unlimited history
HISTSIZE=-1
HISTFILESIZE=-1

# Aliases

alias ls='ls --color=always'
alias dot='git --git-dir=$HOME/.dots/ --work-tree=$HOME'
alias venv='source $HOME/Documents/scripts/various/venv'
# alias shut='systemctl poweroff'
# alias r='lfcd'


# Variables

export sal='ginkobab@192.168.178.222'
export GOPATH="$HOME/golearn"
export GOBIN="$GOPATH/golearn/bin"
export EDITOR='vim' 
export VISUAL='less'
export OPENER='xdg-open'
export BROWSER='firefox'
export TERMINAL='xterm-kitty'
export VIRTUAL_ENV_DISABLE_PROMPT=1
export TESSDATA_PREFIX=/usr/local/share/tessdata/
export PATH=$HOME/golearn/bin:$PATH


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
    else
        # In case you don't have one activated
        venv=""
    fi
	echo $venv
}


colorize() {
	effect=''
	space=''
	if [[ $@ == *space* ]]; then
		space=' '
	fi
	if [[ $@ == *bold* ]]; then
		effect=01;
	fi
	
	esc='\[\033'
	white='[0m\]'
	color="[$effect;38;5;$1m\]"
	word="$2"
	if [[ $word == space ]]; then 
		word=''
		space=''
	fi
	echo "$esc$color$word$esc$white$space"
}


# Colors

# put_template explained:
# \033]4; is the command to set an ansi color number to a string (man console_codes
# %d;rgb:%s takes the ansi colore codes and the color string and replace the first with the second
# \033\\ escapes

put_template() { printf '\033]4;%d;rgb:%s\033\\' $@; } 

base00="28/28/28" # ----
base01="3c/38/36" # ---
base02="50/49/45" # --
base03="66/5c/54" # -
base04="bd/ae/93" # +
base05="d5/c4/a1" # ++
base06="eb/db/b2" # +++
base07="fb/f1/c7" # ++++
base08="fb/49/34" # red
base09="fe/80/19" # orange
base0A="fa/bd/2f" # yellow
base0B="b8/bb/26" # green
base0C="8e/c0/7c" # aqua/cyan
base0D="83/a5/98" # blue
base0E="d3/86/9b" # purple
base0F="d6/5d/0e" # brown




formatColor(){ 
    echo $1 | sed -e 's/\///g' -e 's/^/#/'; 
}



# 16 color space
put_template 0  $base00 # ----
put_template 1  $base08 # red
put_template 2  $base0B # green
put_template 3  $base0A # yellow
put_template 4  $base0D # blue
put_template 5  $base0E # purple
put_template 6  $base0C # aqua
put_template 7  $base05 # ++
put_template 8  $base06 # +++
put_template 9  $base09 # orange
put_template 10 $base0B # green
put_template 11 $base0A # yellow
put_template 12 $base0D # blue
put_template 13 $base04 # +
put_template 14 $base0C # aqua
put_template 15 $base07 # ++++

checkdir(){
	case $1 in
		$HOME/livequiz*)
			source $HOME/.virtualenvs/livequiz/bin/activate
		;;
		$HOME/Thesis*)
			source $HOME/.virtualenvs/tesi/bin/activate
		;;
		$HOME/goapp*)
			export GOBIN="$HOME/goapp/backend/bin"
			export GOPATH="$HOME/goapp/backend"

	esac
}

set_ps1(){
	checkdir $(pwd)
	venv="$(virtualenv_info)" 
	host="$(hostname)"
	branch="$(__git_ps1)"
	dir='\W'
	prompt=''

	ps_dir=$(colorize 4 $dir bold)
	ps_host=$(colorize 7 "$host" space bold)
	ps_branch=$(colorize 3 "$branch" bold)
	ps_venv=$(colorize 5 $venv space bold)
	ps_prompt=$(colorize 9 $prompt space)

	PS1="\n$ps_host$ps_branch\n$ps_dir\n$ps_venv$ps_prompt"

}
PROMPT_COMMAND=set_ps1
