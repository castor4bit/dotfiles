#! /bin/sh

# install dotfiles
FILES=(.gemrc .gitconfig .gitignore .gvimrc .inputrc .screenrc .vimrc .zshrc)

for file in ${FILES[@]}; do
  if [ ! -f "$HOME/$file" ]; then
    ln -s $(cd $(dirname $0) && pwd)/$file $HOME/$file
  fi
done

# change default shell to zsh
grep '/usr/local/bin/zsh' /etc/shells > /dev/null
if [ $? -ne 0 ]; then
  sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
fi
chsh -s /usr/local/bin/zsh

# install ruby
eval "$(rbenv init -)"
CONFIGURE_OPTS="--enable-shared --with-readline-dir=/usr/local" rbenv install 2.1.2
rbenv global 2.1.2
rbenv rehash

gem install bundler --no-ri --no-rdoc
rbenv rehash

# install perl
curl -skL http://install.perlbrew.pl | bash
source ~/perl5/perlbrew/etc/bashrc
perl_version=$(perlbrew available | grep perl-5.20)
perlbrew install $perl_version
perlbrew switch  $perl_version

perlbrew install-cpanm
cpanm Data::Dumper LWP::UserAgent

# install nodejs
curl -sL git.io/nodebrew | perl - setup
export PATH=$HOME/.nodebrew/current/bin:$PATH
nodebrew selfupdate
nodebrew install-binary v0.10.29
nodebrew use v0.10.29

npm install -g grunt-cli gulp
npm install -g yo bower
npm install -g less
npm install -g coffee-script
npm install -g mocha expect.js testem sinon
npm install -g hubot
npm install -g casperjs
npm install -g http-server

# setup vim
[ ! -d ~/.vim/bundle ] && mkdir -p ~/.vim/bundle && git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim && echo "you should run following command to setup plugins ->  vim -c ':NeoBundleInstall'"

# cdd
git clone https://github.com/m4i/cdd.git ~/.zsh/cdd

# enable locate
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist
sudo /usr/libexec/locate.updatedb
