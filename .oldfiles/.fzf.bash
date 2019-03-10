# Setup fzf
# ---------
if [[ ! "$PATH" == */home/ginko/.fzf/bin* ]]; then
  export PATH="$PATH:/home/ginko/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/ginko/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/ginko/.fzf/shell/key-bindings.bash"

