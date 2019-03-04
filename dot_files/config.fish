#!/usr/sh

#prompt colours
if status --is-interactive
    source "$HOME/dot_files/pure_source.fish"
end

# Autologin
if status is-login
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
            exec startx -- -keeptty
    end
end

# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end

# Pyenv
#set -U PYENV_ROOT $HOME/.pyenv
#set PATH $PYENV_ROOT/bin $PATH

#if command -v pyenv 1>/dev/null 2>&1
#    eval "pyenv init - | source"
#end

