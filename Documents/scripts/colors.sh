#!/bin/fish
## Colors from gruvbox
set col_bg                          "#282828" # base00
set col_red1                        "#9d0006"
set col_red2                        "#cc241d"
set col_red3                        "#fb4934" # base08 
set col_green1                      "#79740e"
set col_green2                      "#98971a"
set col_green3                      "#b8bb26" # base0B
set col_yellow1                     "#b57614" 
set col_yellow2                     "#d79921"
set col_yellow3                     "#fabd2f" # base0A
set col_blue1                       "#076678"
set col_blue2                       "#458588"
set col_blue3                       "#83a598" # base0D
set col_purple1                     "#8f3f71"
set col_purple2                     "#b16286"
set col_purple3                     "#d3869b" # base0E 
set col_aqua1                       "#427b58"
set col_aqua2                       "#689d6a"
set col_aqua3                       "#8ec07c" # base0C
#set col_gray1                       "#7c6f64"
#set col_gray2                       "#928374"
#set col_gray3                       "#a89984"
set col_fg2                         "#d5c4a1" # base05
set col_gray1                       "#665c54" # base03
set col_orange2                     "#fe8019" # base09 
set col_gray3                       "#3c3836" # base01
set col_gray2                       "#504945" # base02
set col_fg3                         "#bdae93" # base04
set col_fg                          "#ebdbb2" # base06
set col_orange1                     "#d65d0e" # base0F
set col_white                       "#fbf1c7" # base07


set -l color00 '#282828' #bg
set -l color01 '#3c3836'
set -l color02 '#504945'
set -l color03 '#665c54'
set -l color04 '#bdae93'
set -l color05 '#d5c4a1'
set -l color06 '#ebdbb2' #fg
set -l color07 '#fbf1c7' #white
set -l color08 '#fb4934' #red
set -l color09 '#fe8019' #orange dark
set -l color0A '#fabd2f' #yellow
set -l color0B '#b8bb26' #green
set -l color0C '#8ec07c' #aqua
set -l color0D '#83a598' #blue
set -l color0E '#d3869b' #purple
set -l color0F '#d65d0e' #orange

# FZF colours
set -U FZF_DEFAULT_OPTS "
  --color bg+:$color01,bg:$color00,spinner:$color09,hl:$color09
  --color fg:$color04,header:$color0D,info:$color0A,pointer:$color09
  --color marker:$color0F,fg+:$color06,prompt:$color0A,hl+:$color09
"

## Editor
set -U VISUAL nvim
set -U EDITOR nvim


## Prompt SPACEFISH conf
set -U SPACEFISH_PROMPT_ADD_NEWLINE    true
set -U SPACEFISH_PROMPT_SEPARATE_LINE  true
# set -U SPACEFISH_USER_COLOR yellow
set -U SPACEFISH_DIR_COLOR             "$col_blue2"     
set -U SPACESHIP_DIR_LOCK_COLOR        "$col_red3"
set -U SPACEFISH_GIT_BRANCH_COLOR      "$col_yellow2"
set -U SPACEFISH_GIT_STATUS_COLOR      "$col_red3"
set -U SPACEFISH_PYENV_SYMBOL          " "
set -U SPACEFISH_PYENV_COLOR           "$color0F"
set -U SPACEFISH_VI_MODE_COLOR         "$col_fg"
set -U SPACEFISH_CHAR_SYMBOL           ">>"
set -U SPACEFISH_CHAR_COLOR_SUCCESS    "$col_fg"
set -U SPACEFISH_CHAR_COLOR_FAILURE    "$col_fg"
set -U SPACEFISH_EXEC_TIME_SHOW        false
set -U SPACEFISH_EXEC_TIME_COLOR       "$col_aqua1"
set -U SPACEFISH_EXEC_TIME_ELAPSED     6000

## fzf settings
set -U FZF_LEGACY_KEYBINDINGS 0


## Shell completion and autosuggestion colors

#### THIS SHOULD BE HANDLED BY chriskempson/base16-shell

#set -U fish_color_normal            "$col_blue2"
#set -U fish_color_command           "$col_red3"
#set -U fish_color_quote             "$col_aqua1" 
#set -U fish_color_redirection       "$col_aqua3"
#set -U fish_color_end               "$col_green2"
#set -U fish_color_error             "$col_aqua3"
#set -U fish_color_param             "$col_blue2"
#set -U fish_color_comment           "$col_gray3"
#set -U fish_color_match             "$col_aqua2"
#set -U fish_color_selection         "$col_red1"
#set -U fish_color_search_match      "$col_yellow2"
#set -U fish_color_operator          "$col_aqua1"
#set -U fish_color_escape            "$col_aqua2"
#set -U fish_color_cwd               "$col_gray2"
#set -U fish_color_autosuggestion    "$col_green3"
#set -U fish_color_user              "$col_gray2"
#set -U fish_color_host              "$col_gray2"
#set -U fish_color_cancel            "$col_aqua2"
#set -U fish_pager_color_prefix      "$col_blue2"
#set -U fish_pager_color_completion  "$col_blue1"
#set -U fish_pager_color_descrition  "$col_aqua2"
#set -U fish_pager_color_progress    "$col_blue3"
#set -U fish_pager_color_secondary   "$col_bg"
