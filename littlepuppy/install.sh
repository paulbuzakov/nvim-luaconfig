#!/usr/bin/sh

set path ~/.config/nvbn
export path

rm -rf $path

mkdir $path
mkdir $path/share
cp -avR nvim $path/nvim

stow --restow --target=$path/nvim .

alias vbn='XDG_DATA_HOME=$path/share XDG_CONFIG_HOME=$path vim'
