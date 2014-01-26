#! /bin/sh

FILES=(".gitconfig" ".gitignore" ".inputrc" ".screenrc" ".vimrc" ".zshrc")

for file in ${FILES[@]}; do
  if [ ! -f "$HOME/$file" ]; then
    ln -s `dirname $0`/$file $HOME/$file
  fi
done
