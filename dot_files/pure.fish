set --universal pure_version 2.1.1 # used for bug report

# Base16 colors
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

# Base colors
_pure_set_default pure_color_primary (set_color $color0D) #directory
_pure_set_default pure_color_info    (set_color $color07)
_pure_set_default pure_color_mute    (set_color $color0F) #venv and git
_pure_set_default pure_color_success (set_color $color04) #normal prompt
_pure_set_default pure_color_normal  (set_color $color07)
_pure_set_default pure_color_danger  (set_color red)
_pure_set_default pure_color_light   (set_color white)
_pure_set_default pure_color_warning (set_color yellow)
_pure_set_default pure_color_dark    (set_color black)

# Prompt
_pure_set_default pure_symbol_prompt           "❯"
_pure_set_default pure_symbol_reverse_prompt   "❮" # used for VI mode
_pure_set_default pure_color_prompt_on_error   $pure_color_danger
_pure_set_default pure_color_prompt_on_success $pure_color_success

# Current Working Directory
_pure_set_default pure_color_current_directory $pure_color_primary

# Git
_pure_set_default pure_symbol_git_unpulled_commits "⇣"
_pure_set_default pure_symbol_git_unpushed_commits "⇡"
_pure_set_default pure_symbol_git_dirty            "*"
_pure_set_default pure_color_git_unpulled_commits  $pure_color_info
_pure_set_default pure_color_git_unpushed_commits  $pure_color_info
_pure_set_default pure_color_git_branch            $pure_color_mute
_pure_set_default pure_color_git_dirty             $pure_color_mute

# SSH info
_pure_set_default pure_color_ssh_hostname    $pure_color_mute
_pure_set_default pure_color_ssh_separator   $pure_color_mute
_pure_set_default pure_color_ssh_user_normal $pure_color_mute
_pure_set_default pure_color_ssh_user_root   $pure_color_light

# Virtualenv for Pyhon
_pure_set_default pure_color_virtualenv $pure_color_mute
# Deactivate the default virtualenv prompt so that we can add our own
set --global --export VIRTUAL_ENV_DISABLE_PROMPT 1

# Print current working directory at the beginning of prompt
# true (default):   current directory, git, user@hostname (ssh-only), command duration
# false:            user@hostname (ssh-only), current directory, git, command duration
_pure_set_default pure_begin_prompt_with_current_directory true

# Show exit code of last command as a separate prompt character (cf. https://github.com/sindresorhus/pure/wiki#show-exit-code-of-last-command-as-a-separate-prompt-character)
# false - single prompt character, default
# true - separate prompt character
_pure_set_default pure_separate_prompt_on_error false

# Max execution time of a process before its run time is shown when it exits
_pure_set_default pure_threshold_command_duration 1116
_pure_set_default pure_color_command_duration     $pure_color_warning

# Right Prompt variables
_pure_set_default pure_right_prompt ""
_pure_set_default pure_color_right_prompt $pure_color_normal

# VI mode indicator
# true (default):  indicate a non-insert mode by reversing the prompt symbol (❮)
# false:           indicate vi mode with [I], [N], [V]  
_pure_set_default pure_reverse_prompt_symbol_in_vimode true

# Title
_pure_set_default pure_symbol_title_bar_separator "—"

# Whether or not is a fresh session
set --global _pure_fresh_session true
