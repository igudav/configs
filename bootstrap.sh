#!/bin/bash

cd

if [ ! -d anaconda3 ]; then
    echo "Download anaconda first"
    exit 1
fi

if [ -f .bashrc ]; then
    rm .bashrc
fi
ln -rs configs/.bashrc

if [ -f .vimrc ]; then
    rm .vimrc
fi
ln -rs configs/.vimrc

if [ -d .vim ]; then
    rm -rf .vim
fi
mkdir .vim
ln -rs configs/.vim/coc-settings.json .vim/coc-settings.json

ln -rs configs/.tmux.conf
ln -rs configs/.gitignore

# install nodejs
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/c92adb3c479d70bb29f4399a808c972ef41510e7/install.sh | bash
source ~/.bashrc
nvm install --lts

# configuring vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PluginInstall +qall
