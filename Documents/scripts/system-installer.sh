#!/usr/bin/fish

### --------------- MAIN PACKAGES ---------------
cd $HOME
wget https://raw.githubusercontent.com/ginkobab/dots/master/.pkglist
sudo pacman -S (cat .pkglist)
rm .pkglist

fish
mkdir packs && cd packs

# git clone https://aur.archlinux.org/mellowplayer.git
# cd mellowplayer && makepkg -si && cd ..

git clone https://github.com/ginkobab/jupyterlab-vim

### --------------- FONT ---------------
cd /usr/share/fonts
sudo wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/AnonymousPro/complete/Anonymice%20Nerd%20Font%20Complete%20Mono.ttf

fc-cache

### --------------- VIRTUALENV --------------- 
python3 -m venv ~/.virtualenvs/env
# put requirements here

### --------------- FISH AS DEFAULT SHELL ---------------
chsh -s /usr/bin/fish

### --------------- VIM-PLUG ---------------
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

### --------------- DOT FILES --------------- 
cd $HOME
echo ".dots" >> .gitignore

git clone --bare https://github.com/ginkobab/dots $HOME/.dots

rm $HOME/.config/fish/fish_variables
git --git-dir=$HOME/.dots --work-tree=$HOME checkout
git --git-dir=$HOME/.dots --work-tree=$HOME config --local status.showUntrackedFiles no

### --------------- SUCKLESS ---------------
cd $HOME/Packs/dwm-git/src/dwm     && sudo make clean install
cd $HOME/Packs/dmenu-git/src/dmenu && sudo make clean install
cd $HOME/Packs/st-git/src/st       && sudo make clean install
cd $HOME/Packs/slstatus/src/sl     && sudo make clean install

### --------------- DAEMONS ---------------
systemctl enable --now tlp

