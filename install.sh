#! /bin/sh

FILES=(".gitconfig" ".gitignore" ".inputrc" ".screenrc" ".vimrc" ".zshrc")

for file in ${FILES[@]}; do
  if [ ! -f "$HOME/$file" ]; then
    ln -s $(cd $(dirname $0) && pwd)/$file $HOME/$file
  fi
done
