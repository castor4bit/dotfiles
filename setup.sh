#! /bin/sh

# install dotfiles
FILES=(\
  .config/mpv/mpv.conf \
  .config/vim/init.vim \
  .eslintrc \
  .gemrc \
  .gitconfig \
  .gitignore \
  .gvimrc \
  .inputrc \
  .tern-config \
  .tmux.conf \
  .tigrc \
  .vimrc \
  .zshenv \
  .zshrc \
)

for file in ${FILES[@]}; do
  if [ ! -f "$HOME/$file" ]; then
    mkdir -p $(dirname $HOME/$file)
    ln -s $(cd $(dirname $0) && pwd)/$file $HOME/$file
  fi
done

# change default shell to zsh
grep '/usr/local/bin/zsh' /etc/shells > /dev/null
if [ $? -ne 0 ]; then
  sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
fi
chsh -s /usr/local/bin/zsh

# ssh settings for sierra (or later)
echo -e "Host *\n  UseKeychain yes\n  AddKeysToAgent yes\n" >> ~/.ssh/config

# symlink diff-highlight
ln -s /usr/local/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin

# install ruby
eval "$(rbenv init -)"
ruby_version=2.6.5
CONFIGURE_OPTS="--enable-shared --with-readline-dir=/usr/local" rbenv install $ruby_version
rbenv global $ruby_version
rbenv rehash

gem install bundler --no-ri --no-rdoc
rbenv rehash

# install perl
curl -skL http://install.perlbrew.pl | bash
source ~/perl5/perlbrew/etc/bashrc
perl_version=$(perlbrew available | grep perl-5.30.1 | awk '{print $1}')
perlbrew install $perl_version
perlbrew switch  $perl_version
perlbrew install-cpanm

# install nodejs
curl -sL git.io/nodebrew | perl - setup
export PATH=$HOME/.nodebrew/current/bin:$PATH
node_version=v12.13.1
nodebrew selfupdate
nodebrew install-binary $node_version
nodebrew use $node_version

npm install -g babel-eslint
npm install -g browserify
npm install -g eslint
npm install -g eslint-plugin-react
npm install -g gulp
npm install -g http-server
npm install -g jsctags
npm install -g jshint
npm install -g js-beautify
npm install -g stylelint
npm install -g yarn
npm upgrade -g npm

# setup vim
brew linkapps macvim-kaoriya
[ ! -d ~/.vim/bundle ] && mkdir -p ~/.vim/bundle && git clone git://github.com/Shougo/dein.vim ~/.vim/bundle/dein.vim
vim -c ":call dein#install()" -c ":GoInstallBinaries" -c ":q"

mkdir -p $HOME/.vim/ref/php
curl -Ls http://php.net/get/php_manual_en.tar.gz/from/this/mirror | tar -zx
mv php-chunked-xhtml $HOME/.vim/ref/php/

mkdir -p $HOME/.vim/dict
curl -Ls https://arcane-tor-6144.herokuapp.com/ -o $HOME/.vim/dict/PHP.dict

# cdd
git clone https://github.com/m4i/cdd.git ~/.zsh/cdd

# enable locate
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist
sudo /usr/libexec/locate.updatedb
