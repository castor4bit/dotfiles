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
  .screenrc \
  .tern-config \
  .vimrc \
  .zshrc \
  .zshenv \
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

# fix path_helper
grep PATH /etc/zshenv > /dev/null || sudo sed -i '' -e $'3 i\\\nPATH=""' /etc/zshenv

# install ruby
eval "$(rbenv init -)"
CONFIGURE_OPTS="--enable-shared --with-readline-dir=/usr/local" rbenv install 2.3.1
rbenv global 2.3.1
rbenv rehash

gem install bundler --no-ri --no-rdoc
rbenv rehash

# install perl
curl -skL http://install.perlbrew.pl | bash
source ~/perl5/perlbrew/etc/bashrc
perl_version=$(perlbrew available | grep perl-5.24)
perlbrew install $perl_version
perlbrew switch  $perl_version

perlbrew install-cpanm
cpanm Data::Dumper LWP::UserAgent

# install nodejs
curl -sL git.io/nodebrew | perl - setup
export PATH=$HOME/.nodebrew/current/bin:$PATH
nodebrew selfupdate
nodebrew install-binary v4.5.0
nodebrew use v4.5.0

npm install -g babel-eslint
npm install -g bower
npm install -g browserify
npm install -g casperjs
npm install -g coffee-script
npm install -g eslint
npm install -g eslint-plugin-react
npm install -g expect
npm install -g express
npm install -g generator-chrome-extension
npm install -g generator-jasmine
npm install -g generator-ko
npm install -g generator-mocha
npm install -g grunt-cli
npm install -g gulp
npm install -g http-server
npm install -g hubot
npm install -g less
npm install -g jsctags
npm install -g jshint
npm install -g js-beautify
npm install -g mocha
npm install -g sinon
npm install -g testem
npm install -g watchify
npm install -g yo
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
