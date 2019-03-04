#!/usr/bin/fish
if test -d ~/.dot_backups
    echo Directory Present
else
    echo Directory Not Present
    mkdir ~/.dot_backups
    echo Directory Created
end

mv --verbose ~/.config/fish/config.fish                                 ~/.dot_backups/
mv --verbose ~/.bash_profile                                            ~/.dot_backups/bash_profile
mv --verbose ~/.xinitrc                                                 ~/.dot_backups/xinitrc
mv --verbose ~/.bashrc                                                  ~/.dot_backups/bashrc
mv --verbose ~/.vimrc                                                   ~/.dot_backups/vimrc
mv --verbose ~/.Xresources                                              ~/.dot_backups/Xresources
mv --verbose ~/.config/nvim/init.vim                                    ~/.dot_backups/init.vim
mv --verbose ~/.config/zathura/zathurarc                                ~/.dot_backups/zathurarc
mv --verbose ~/.tmux.conf                                               ~/.dot_backups/tmux.conf
mv --verbose ~/.config/qutebrowser/config.py                            ~/.dot_backups/config.py
mv --verbose ~/.config/qutebrowser/base16-gruvbox-dark-medium.config.py ~/.dot_backups/base16-gruvbox-dark-medium.config.py
mv --verbose ~/.jupyter/jupyter_notebook_config.py                      ~/.dot_backups/jupyter_notebook_config.py
mv --verbose ~/.config/ranger/rc.conf                                   ~/.dot_backups/rc.conf
mv --verbose ~/.config/ranger/rifle.conf                                ~/.dot_backups/rifle.conf 

ln --symbolic --verbose ~/dot_files/xinitrc                              ~/.xinitrc
ln --symbolic --verbose ~/dot_files/bashrc                               ~/.bashrc
ln --symbolic --verbose ~/dot_files/vimrc                                ~/.vimrc
ln --symbolic --verbose ~/dot_files/Xresources                           ~/.Xresources
ln --symbolic --verbose ~/dot_files/init.vim                             ~/.config/nvim/init.vim
ln --symbolic --verbose ~/dot_files/zathurarc                            ~/.config/zathura/zathurarc
ln --symbolic --verbose ~/dot_files/tmux.conf                            ~/.tmux.conf
ln --symbolic --verbose ~/dot_files/config.py                            ~/.config/qutebrowser/config.py
ln --symbolic --verbose ~/dot_files/base16-gruvbox-dark-medium.config.py ~/.config/qutebrowser/base16-gruvbox-dark-medium.config.py
ln --symbolic --verbose ~/dot_files/bash_profile                         ~/.bash_profile
ln --symbolic --verbose ~/dot_files/config.fish                          ~/.config/fish/config.fish
ln --symbolic --verbose ~/dot_files/jupyter_notebook_config.py           ~/.jupyter/jupyter_notebook_config.py
ln --symbolic --verbose ~/dot_files/rc.conf                              ~/.config/ranger/rc.conf
ln --symbolic --verbose ~/dot_files/rifle.conf                           ~/.config/ranger/rifle.conf


# Font
if test -e /usr/share/fonts/Anonymice%20Nerd%20Font%20Complete.ttf
    echo "Font already present"
else if test -L /usr/share/fonts/Anonymice%20Nerd%20Font%20Complete.ttf
    echo "Font already linked"
else 
    sudo ln --symbolic --verbose ~/dot_files/Anonymice%20Nerd%20Font%20Complete.ttf /usr/share/fonts/Anonymice%20Nerd%20Font%20Complete.++ttf
    fc-cache
end
