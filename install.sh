#!/bin/bash
rm -rf ~/.vimrc.bak
rm -rf ~/.vimbak
mv ~/.vimrc ~/.vimrc.bak
mv ~/.vim ~/.vimbak
cp ./vimrc/.vimrc ~/.vimrc
cp ./plugs/.vim/ ~/.vim -r
