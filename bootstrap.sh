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
ln -rs configs/.vim

ln -rs configs/.tmux.conf
ln -rs configs/.gitignore
