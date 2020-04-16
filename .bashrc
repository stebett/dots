# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.git-prompt.sh

# Temporary functions
alias tesi='source ~/.virtualenvs/tesi/bin/activate && cd ~/Thesis/'
alias tesisal='export TERM=xterm-256color && ssh ginkobab@salvatore -t tmux a'
alias vtesi='source ~/.virtualenvs/tesi/bin/activate && cd ~/Thesis/ && nvim .'
alias vtesisal='nvim scp://ginkobab@192.168.178.222/~/Thesis/'


# Unlimited history
HISTSIZE=-1
HISTFILESIZE=-1

# Aliases

alias ls='ls --color=always'
alias mm='rm config.h && make && sudo make clean install'
alias lowpow='source $HOME/Documents/scripts/battery/battery_saver.sh'
alias dot='git --git-dir=$HOME/.dots/ --work-tree=$HOME'
alias gp="git add . && git commit -m 'auto-commit' && git push origin master"
alias venv='source $HOME/Documents/scripts/various/venv'
alias won='sudo $HOME/Documents/scripts/wifi/./scan'
alias woff='sudo $HOME/Documents/scripts/wifi/./plane-mode'
alias shut='systemctl poweroff'
alias v='nvim'
alias n='nvim $HOME/.config/nvim/init.vim'
alias r=lfcd 
alias ipython="ipython --no-banner"
alias icat="kitty +kitten icat"



# Keybindings

bind '"\er":"lfcd\C-m"'
bind '"\C-v":"fo\C-m"'


# Variables

export sal='ginkobab@192.168.178.222'
export EDITOR='nvim' 
export INIT='/home/ginko/.config/nvim/init.vim'
export VISUAL='less'
export OPENER='xdg-open'
export BROWSER='brave'
export TERMINAL='st'
export VIRTUAL_ENV_DISABLE_PROMPT=1
export TESSDATA_PREFIX=/usr/local/share/tessdata/


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

# source $HOME/Packs/nest-simulator/install_dict/bin/nest_vars.sh
# Modified version where you can press
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fo() (
  IFS=$'\n' out=("$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)")
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
	  [ "$key" = ctrl-o ] && ( (setsid xdg-open "$file" &) && kill -9 $PPID) || ${EDITOR:-vim} "$file"
  fi
)


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
put_template 12 $base02 # --
put_template 13 $base04 # +
put_template 14 $base0C # aqua
put_template 15 $base07 # ++++

export base00=$(formatColor $base00) # ----
export base01=$(formatColor $base01) # ---
export base02=$(formatColor $base02) # --
export base03=$(formatColor $base03) # -
export base04=$(formatColor $base04) # +
export base05=$(formatColor $base05) # ++
export base06=$(formatColor $base06) # +++
export base07=$(formatColor $base07) # ++++
export base08=$(formatColor $base08) # red
export base09=$(formatColor $base09) # orange
export base0A=$(formatColor $base0A) # yellow
export base0B=$(formatColor $base0B) # green
export base0C=$(formatColor $base0C) # aqua/cyan
export base0D=$(formatColor $base0D) # blue
export base0E=$(formatColor $base0E) # purple
export base0F=$(formatColor $base0F) # brown

set_ps1(){
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
