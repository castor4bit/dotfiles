#!/bin/bash

# install dotfiles
FILES=(\
  .config/alacritty/alacritty.yml \
  .config/git/config \
  .config/git/ignore \
  .config/mpv/mpv.conf \
  .config/vim/init.vim \
  .config/wezterm/wezterm.lua \
  .zsh/functions/tmux.zsh \
  .eslintrc \
  .gemrc \
  .gvimrc \
  .inputrc \
  .rgignore \
  .ripgreprc \
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
ruby_version=3.1.2
RUBY_CONFIGURE_OPTS="--enable-shared --with-readline-dir=/usr/local" rbenv install $ruby_version
rbenv global $ruby_version
rbenv rehash

gem install bundler --no-document
gem install pry     --no-document
rbenv rehash

# install perl
curl -skL http://install.perlbrew.pl | bash
source ~/perl5/perlbrew/etc/bashrc
perl_version=$(perlbrew available | grep perl-5.34.0 | awk '{print $1}')
perlbrew install $perl_version
perlbrew switch  $perl_version
perlbrew install-cpanm

# install nodejs
eval "$(nodenv init -)"
node_version=18.1.0
nodenv install $node_version
nodenv global $node_version

npm install -g js-beautify
npm upgrade -g npm

# install nodenv plugins
mkdir -p "$(nodenv root)"/plugins
git clone https://github.com/nodenv/nodenv-update.git "$(nodenv root)/plugins/nodenv-update"
git clone https://github.com/nodenv/nodenv-npm-migrate.git "$(nodenv root)/plugins/nodenv-npm-migrate"

# setup vim
curl -sL https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh | bash -s -- ~/.cache/dein
vim -c ":call dein#install()" -c ":GoInstallBinaries" -c ":q"

# dircolors
mkdir -p ~/.zsh/dircolors
git clone https://github.com/seebi/dircolors-solarized.git ~/.zsh/dircolors/dircolors-solarized
ln -sf ~/.zsh/dircolors/dircolors-solarized/dircolors.256dark ~/.zsh/dircolors/current
sed -i -e "s/^NORMAL 00;38;5;244/NORMAL 00;38;5;250/" ~/.zsh/dircolors/current

# cdd
git clone https://github.com/m4i/cdd.git ~/.zsh/cdd

# enable locate
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist
sudo /usr/libexec/locate.updatedb
