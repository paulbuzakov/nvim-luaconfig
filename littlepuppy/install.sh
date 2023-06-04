#!/usr/bin/sh

set path ~/.config/nvbn
export path

rm -rf $path

mkdir $path
mkdir $path/share
cp -avR nvim $path/nvim
cp -av vbn.sh $path

stow --restow --target=$path/nvim .
