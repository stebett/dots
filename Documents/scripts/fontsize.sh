#!/usr/bin/fish

read -l -P "Insert desired pixel size: " size
cd $HOME/Packs/dwm-git/src/dwm
sed -i "s/pixelsize=13/pixelsize=$size/" config.def.h
sudo rm config.h
make
sudo make clean install

cd $HOME/Packs/st-git/src/st
sed -i "s/pixelsize=13/pixelsize=$size/" config.def.h
rm config.h
make
sudo make clean install
echo "[*]"
echo "Now you should restart dwm with C-S-W-Q"





