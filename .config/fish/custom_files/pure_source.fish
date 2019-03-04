#!/usr/bin/fish

set -l color04 '#bdae93'
set -l color0F '#d65d0e' #orange
set -l color0D '#83a598' #blue

set -U pure_color_primary (set_color $color0D) #directory
set -U pure_color_success (set_color $color04) #normal prompt
set -U pure_color_mute    (set_color $color0F) #venv   and git
set -U pure_threshold_command_duration 1116
