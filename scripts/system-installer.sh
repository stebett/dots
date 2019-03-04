#!/usr/bin/fish

### --------------- MAIN PACKAGES ---------------
cd $HOME
wget https://raw.githubusercontent.com/ginkobab/dots/master/.pkglist
sudo pacman -S (cat .pkglist)
rm .pkglist

mkdir packs && cd packs

# git clone https://aur.archlinux.org/mellowplayer.git
# cd mellowplayer && makepkg -si && cd ..

git clone https://github.com/ginkobab/jupyterlab-vim

### --------------- FONT ---------------
cd /usr/share/fonts
sudo wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/AnonymousPro/complete/Anonymice%20Nerd%20Font%20Complete%20Mono.ttf

fc-cache

### --------------- DOT FILES --------------- 
cd $HOME
echo ".dots" >> .gitignore

git clone --bare https://github.com/ginkobab/dots $HOME/.dots

rm $HOME/.config/fish/fish_variables
git --git-dir=$HOME/.dots --work-tree=$HOME checkout
git --git-dir=$HOME/.dots --work-tree=$HOME config --local status.showUntrackedFiles no

### --------------- SHELL COLORSCHEME ---------------
git clone https://github.com/chriskempson/base16-shell.git $HOME/.config/base16-shell
cd $HOME/.config/base16-shell/scripts
rm base16-flat.sh
sed "66 s/13/21/" base16-gruvbox-dark-medium.sh > base16-flat.sh
cd ..
sed i.bak "31 s/for//" profile_helper.fish
### --------------- SUCKLESS ---------------
cd $HOME/packs/dwm-git/src/dwm && sudo make clean install
cd $HOME/packs/dmenu-git/src/dmenu && sudo make clean install
cd $HOME/packs/st-git/src/st && sudo make clean install
cd $HOME/packs/surf && sudo make clean install
cd $HOME/packs/tabbed-git/src/tabbed && sudo make clean install
cd $HOME/packs/slstayts/src/sl && sudo make clean install

### --------------- DAEMONS ---------------
systemctl enable --now tlp

echo "Remember to enter 'base16-flat' to change da shell"
