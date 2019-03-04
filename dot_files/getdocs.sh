#!/usr/bin/fish
if test -d ~/dot_files
    echo Directory present 
else 
    echo Directory absent
    mkdir ~/dot_files
    echo Created directory
end

cp --verbose --dereference ~/.xinitrc                                                 ~/dot_files/xinitrc
cp --verbose --dereference ~/.bashrc                                                  ~/dot_files/bashrc
cp --verbose --dereference ~/.vimrc                                                   ~/dot_files/vimrc
cp --verbose --dereference ~/.Xresources                                              ~/dot_files/Xresources
cp --verbose --dereference ~/.config/nvim/init.vim                                    ~/dot_files/init.vim
cp --verbose --dereference ~/.config/zathura/zathurarc                                ~/dot_files/zathurarc
cp --verbose --dereference ~/.tmux.conf                                               ~/dot_files/tmux.conf
cp --verbose --dereference ~/.config/qutebrowser/base16-gruvbox-dark-medium.config.py ~/dot_files/base16-gruvbox-dark-medium.config.py
cp --verbose --dereference ~/.config/qutebrowser/config.py                            ~/dot_files/config.py
cp --verbose --dereference ~/.bash_profile                                            ~/dot_files/bash_profile
cp --verbose --dereference ~/.config/fish/config.fish                                 ~/dot_files/config.fish
cp --verbose --dereference ~/.jupyter/jupyter_notebook_config.py                      ~/dot_files/jupyter_notebook_config.py
cp --verbose --dereference ~/.config/ranger/rc.conf                                   ~/dot_files/rc.conf
cp --verbose --dereference ~/.config/ranger/rifle.conf                                ~/dot_files/rifle.conf
