#!/usr/fish

# preactivate venv
if status --is-interactive
    source "$HOME/.virtualenvs/env2/bin/activate.fish"
end

# prompt colours
if status --is-interactive
    source "$HOME/.config/fish/custom_files/pure_source.fish"
end

# fzf
if status --is-interactive
    source "$HOME/.config/fish/custom_files/fzf_opts.fish"
end

# Autologin
if status is-login
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
            exec startx -- -keeptty
    end
end

# Terminal Colors
if status --is-interactive
    eval sh "$HOME/.config/fish/custom_files/base16-gruvbox-dark-medium.sh"
end
