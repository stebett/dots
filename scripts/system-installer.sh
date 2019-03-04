#!/usr/bin/fish

### --------------- MAIN PACKAGES ---------------
cd $HOME
wget https://raw.githubusercontent.com/ginkobab/dots/master/.pkglist
sudo pacman -S (cat .pkglist)

mkdir packs && cd packs

# git clone https://aur.archlinux.org/mellowplayer.git
# cd mellowplayer && makepkg -si && cd ..

git clone https://github.com/ginkobab/jupyterlab-vim

### --------------- FONT ---------------
cd /usr/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/AnonymousPro/complete/Anonymice%20Nerd%20Font%20Complete%20Mono.ttf

fc-cache

### --------------- DOT FILES --------------- 
cd $HOME
echo ".dots" >> .gitignore

git clone --bare https://github.com/ginkobab/dots $HOME/.dots
git --git-dir=$HOME/.dots --work-tree=$HOME checkout
git --git-dir=$HOME/.dots --work-tree=$HOME config --local status.showUntrackedFiles no

### --------------- SUCKLESS ---------------
cd $HOME/packs/dwm-git/src/dwm && sudo make clean install
cd $HOME/packs/dmenu-git/src/dwm && sudo make clean install
cd $HOME/packs/st-git/src/dwm && sudo make clean install
cd $HOME/packs/surf/src/dwm && sudo make clean install
cd $HOME/packs/tabbed-git/src/dwm && sudo make clean install

### --------------- DAEMONS ---------------
systemctl enable --now tlp
