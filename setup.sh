#! /bin/sh

FILES=(.gemrc .gitconfig .gitignore .inputrc .screenrc .vimrc .zshrc)

for file in ${FILES[@]}; do
  if [ ! -f "$HOME/$file" ]; then
    ln -s $(cd $(dirname $0) && pwd)/$file $HOME/$file
  fi
done

[ ! -d ~/.vim/bundle ] && mkdir -p ~/.vim/bundle && git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim && echo "you should run following command to setup plugins ->  vim -c ':NeoBundleInstall'"
