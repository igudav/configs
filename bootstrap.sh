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
ln -rs configs/.vim/ftplugin .vim/ftplugin
ln -rs configs/.vim/coc-settings.json .vim/coc-settings.json

ln -rs configs/.tmux.conf
ln -rs configs/.gitignore

# configuring vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
