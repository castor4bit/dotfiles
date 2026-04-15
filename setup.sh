#!/bin/bash

# install dotfiles
FILES=(\
  .config/ghostty/config \
  .config/git/config \
  .config/git/ignore \
  .config/mise/config.toml \
  .config/mpv/mpv.conf \
  .config/vim/init.vim \
  .zsh/functions/tmux.zsh \
  .eslintrc \
  .gemrc \
  .gvimrc \
  .inputrc \
  .rgignore \
  .ripgreprc \
  .terraformrc \
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

# claude code
CLAUDE_FILES=(\
  .claude/settings.json \
  .claude/CLAUDE.md \
  .claude/statusline.sh \
  .claude/hooks/notify.sh \
  .claude/skills/commit/SKILL.md \
)
for file in ${CLAUDE_FILES[@]}; do
  if [ ! -f "$HOME/$file" ]; then
    mkdir -p $(dirname $HOME/$file)
    ln -s $(cd $(dirname $0) && pwd)/$file $HOME/$file
  fi
done
chmod +x $HOME/.claude/statusline.sh
chmod +x $HOME/.claude/hooks/notify.sh

# change default shell to zsh
grep "$(brew --prefix)/bin/zsh" /etc/shells > /dev/null
if [ $? -ne 0 ]; then
  sudo sh -c "echo '$(brew --prefix)/bin/zsh' >> /etc/shells"
fi
chsh -s $(brew --prefix)/bin/zsh

# ssh settings for sierra (or later)
echo -e "Host *\n  UseKeychain yes\n  AddKeysToAgent yes\n" >> ~/.ssh/config

# symlink diff-highlight
ln -s $(brew --prefix)/share/git-core/contrib/diff-highlight/diff-highlight $(brew --prefix)/bin

# install tools via mise
mise install

npm install -g js-beautify
npm upgrade -g npm

# setup vim
curl -sL https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh | bash -s -- ~/.cache/dein
vim -c ":call dein#install()" -c ":q"

# create terraform plugins directory
mkdir -p $HOME/.terraform.d/plugin-cache

# dircolors
mkdir -p ~/.zsh/dircolors
git clone https://github.com/seebi/dircolors-solarized.git ~/.zsh/dircolors/dircolors-solarized
ln -sf ~/.zsh/dircolors/dircolors-solarized/dircolors.256dark ~/.zsh/dircolors/current
sed -i -e "s/^NORMAL 00;38;5;244/NORMAL 00;38;5;250/" ~/.zsh/dircolors/current

# enable locate
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist
sudo /usr/libexec/locate.updatedb
